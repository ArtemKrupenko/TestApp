import UIKit

final class HeaderCellView: UIView {
    
    // MARK: - Properties
    private let container = UIView()
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError(DataString.fatalError)
    }
    
    // MARK: - Internal Functions
    func update(text: String) {
        label.text = text
    }
    
    // MARK: - Private Functions
    private func addSubviews() {
        addSubview(container)
        container.addSubview(label)
    }
    
    private func makeConstraints() {
        container.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            container.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            container.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            container.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            container.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: container.topAnchor, constant: 0),
            label.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -15),
            label.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 15),
            label.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -10) 
        ])
    }
    
    private func configure() {
        self.backgroundColor = .systemGroupedBackground
        addSubviews()
        makeConstraints()
    }
}
