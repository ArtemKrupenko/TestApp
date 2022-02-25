import UIKit

final class View: UIView {
    
    // MARK: - Properties
    public var tableView: UITableView = {
        let tableview = UITableView(frame: .zero, style: .plain)
        tableview.tableFooterView = UIView()
        tableview.backgroundColor = .systemGroupedBackground
        tableview.separatorStyle = .singleLine
        return tableview
    }()
    
    public let activityIndicatorContainer = UIView()
    
    public let activityIndicator = UIActivityIndicatorView()
    
    // MARK: - Initialization
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError(DataString.fatalError)
    }
    
    // MARK: - Internal Functions
    func addSubviews() {
        addSubview(activityIndicatorContainer)
        activityIndicatorContainer.addSubview(activityIndicator)
        addSubview(tableView)
    }
    
    // MARK: - Private Functions
    private func makeConstraints() {
        activityIndicatorContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicatorContainer.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            activityIndicatorContainer.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            activityIndicatorContainer.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            activityIndicatorContainer.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: activityIndicatorContainer.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: activityIndicatorContainer.centerYAnchor)
        ])
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configure() {
        self.backgroundColor = .systemGroupedBackground
        addSubviews()
        makeConstraints()
    }
}
