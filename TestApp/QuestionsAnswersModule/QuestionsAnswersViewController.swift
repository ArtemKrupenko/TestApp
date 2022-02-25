import UIKit

protocol QuestionsAnswersDisplayLogic: AnyObject {
    func showAlert(error: Error)
    func showLoading(state: Bool)
    func showData(models: [SectionsFAQ])
}

final class QuestionsAnswersViewController: UIViewController {
    
    // MARK: - Properties
    public let searchController = UISearchController(searchResultsController: nil)
    
    public let customView = QuestionsAnswersView()
    
    private let presenter: QuestionsAnswersPresentationLogic
    
    public var models: [SectionsFAQ] = []
    
    public var filteredModels: [SectionsFAQ] = []
    
    // MARK: - Initialization
    init(presenter: QuestionsAnswersPresentationLogic) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError(DataString.fatalError)
    }
    
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
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupSearchController()
        presenter.initialState()
        self.navigationItem.searchController = self.searchController
        self.navigationItem.title = DataString.navigationTitle
    }
    
    // MARK: - Private Functions
    private func setupTableView() {
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
    }
    
    private func setupSearchController() {
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = DataString.search
        searchController.obscuresBackgroundDuringPresentation = false
    }
}

extension QuestionsAnswersViewController: QuestionsAnswersDisplayLogic {
    func showData(models: [SectionsFAQ]) {
        self.models = models
        DispatchQueue.main.async {
            self.customView.tableView.reloadData()
        }
    }
    
    func showLoading(state: Bool) {
        self.customView.setLoadingState(state)
    }
    
    func showAlert(error: Error) {
        let alertController = UIAlertController(title: DataString.error, message: error.localizedDescription, preferredStyle: .alert)
        let repeatAction = UIAlertAction(title: DataString.repeatRequest, style: .default) { [weak self] _ in
            guard let self = self else { return }
            self.presenter.initialState()
        }
        alertController.addAction(repeatAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
