import UIKit

fileprivate extension Appearance {
    var constantZero: CGFloat { 0 }
    var constantTen: CGFloat { 10 }
    var constantFifteen: CGFloat { 15 }
}

final class HeaderCellView: UIView {
    
    // MARK: - Properties
    private let containerView = UIView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = Int(Appearance.instance.constantZero)
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
        titleLabel.text = text
    }
    
    // MARK: - Private Functions
    private func addSubviews() {
        addSubview(containerView)
        containerView.addSubview(titleLabel)
    }
    
    private func makeConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            containerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            containerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Appearance.instance.constantZero),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Appearance.instance.constantFifteen),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Appearance.instance.constantFifteen),
            titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -Appearance.instance.constantTen)
        ])
    }
    
    private func configure() {
        self.backgroundColor = .systemGroupedBackground
        addSubviews()
        makeConstraints()
    }
}
