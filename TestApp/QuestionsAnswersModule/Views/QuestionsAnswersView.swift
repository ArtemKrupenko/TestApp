import UIKit

final class QuestionsAnswersView: UIView {
    
    // MARK: - Properties
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .systemGroupedBackground
        tableView.separatorStyle = .singleLine
        tableView.register(QuestionsAnswersCell.self, forCellReuseIdentifier: DataString.Identifier.cell)
        return tableView
    }()
    
    public let activityIndicator = UIActivityIndicatorView()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError(DataString.fatalError)
    }
    
    // MARK: - Internal Functions
    func setLoadingState(_ state: Bool) {
        if state {
            tableView.isHidden = true
            activityIndicator.startAnimating()
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.activityIndicator.stopAnimating()
                self.tableView.isHidden = false
                // подумать как вынести! - нужно ли вообще это делать?
//                self.navigationItem.searchController = self.searchController
//                self.navigationItem.title = DataString.navigationTitle
            }
        }
    }
    
    // MARK: - Private Functions
    private func makeConstraints() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor)
        ])
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func addSubviews() {
        addSubview(tableView)
        addSubview(activityIndicator)
    }
    
    private func configure() {
        self.backgroundColor = .systemGroupedBackground
        addSubviews()
        makeConstraints()
    }
}
