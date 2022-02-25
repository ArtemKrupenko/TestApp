import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Properties
    public let mainView = View()
    
    public let provider = Provider()
    
    public var items: [DataFAQ]? = []
    
    public var sectionsFAQ: [SectionsFAQ] = []
    
    public var filteredSectionsFAQ: [SectionsFAQ] = []
    
    public let searchController = UISearchController(searchResultsController: nil)
    
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    public var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        getData()
        setupSearchBar()
    }
    
    // MARK: - Internal Functions
    func getData() {
        setLoadingState(true)
        provider.request(urlString: DataString.url) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let model):
                self.sectionsFAQ = model
                self.items = model.first?.items
                DispatchQueue.main.async {
                    self.mainView.tableView.reloadData()
                }
            case .failure(let error):
                self.showAlert(error: error)
            }
        }
        setLoadingState(false)
    }
    
    // MARK: - Private Functions
    private func setupView() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(TableViewCell.self, forCellReuseIdentifier: DataString.Identifier.cell)
    }
    
    private func setupSearchBar() {
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = DataString.search
        searchController.obscuresBackgroundDuringPresentation = false
    }
    
    private func showAlert(error: Error) {
        let alertController = UIAlertController(title: DataString.error, message: error.localizedDescription, preferredStyle: .alert)
        let repeatAction = UIAlertAction(title: DataString.repeatRequest, style: .default) { [weak self] _ in
            guard let self = self else { return }
            self.getData()
        }
        alertController.addAction(repeatAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func setLoadingState(_ state: Bool) {
        if state {
            mainView.tableView.isHidden = true
            mainView.activityIndicator.startAnimating()
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.mainView.activityIndicator.stopAnimating()
                self.mainView.tableView.isHidden = false
                self.navigationItem.searchController = self.searchController
                self.navigationItem.title = DataString.navigationTitle
            }
        }
    }
}
