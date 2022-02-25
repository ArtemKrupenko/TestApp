import UIKit

final class TableViewCell: UITableViewCell {
    
    // MARK: - Properties
    private let containerView = UIView()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    private let answerLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.isHidden = true 
        return label
    }()
    
    private var indicatorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: DataString.downArrow)?.withRenderingMode(.alwaysTemplate)
        return imageView
    }()
    
    public var isAnswerLabelHidden: Bool {
        return answerLabel.isHidden
    }
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Internal Functions
    func update(questions: String, answers: String) {
        questionLabel.text = questions
        answerLabel.text = answers
        layoutIfNeeded()
    }
    
    func showAnswerLabel() {
        answerLabel.isHidden = false
        indicatorImageView.image = UIImage(named: DataString.upArrow)?.withRenderingMode(.alwaysTemplate)
    }
    
    func hideAnswerLabel() {
        answerLabel.isHidden = true
        indicatorImageView.image = UIImage(named: DataString.downArrow)?.withRenderingMode(.alwaysTemplate)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if isAnswerLabelHidden, selected {
            showAnswerLabel()
        } else {
            hideAnswerLabel()
        }
    }
    
    // MARK: - Private Functions
    private func addSubviews() {
        contentView.addSubview(containerView)
        containerView.addSubview(indicatorImageView)
        containerView.addSubview(stackView)
        stackView.addArrangedSubview(questionLabel)
        stackView.addArrangedSubview(answerLabel)
    }
    
    private func makeConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10)
        ])
        indicatorImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            indicatorImageView.heightAnchor.constraint(equalToConstant: 20),
            indicatorImageView.widthAnchor.constraint(equalToConstant: 20),
            indicatorImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
            indicatorImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10)
        ])
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 10),
            questionLabel.trailingAnchor.constraint(equalTo: indicatorImageView.leadingAnchor, constant: -10),
            questionLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 15),
            questionLabel.bottomAnchor.constraint(equalTo: answerLabel.topAnchor, constant: -20)
        ])
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            answerLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 15),
            answerLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -30),
            answerLabel.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -20)
        ])
    }
    
    private func configure() {
        self.selectionStyle = .none
        addSubviews()
        makeConstraints()
    }
}
