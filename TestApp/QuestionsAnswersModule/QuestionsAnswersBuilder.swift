import UIKit

protocol ModuleBuilder: AnyObject {
    func build() -> UIViewController
}

final class QuestionsAnswersBuilder: ModuleBuilder {
    func build() -> UIViewController {
        let provider = QuestionsAnswersProvider()
        let presenter = QuestionsAnswersPresenter(provider: provider)
        let viewController = QuestionsAnswersViewController(presenter: presenter)
        presenter.viewController = viewController
        return viewController
    }
}
