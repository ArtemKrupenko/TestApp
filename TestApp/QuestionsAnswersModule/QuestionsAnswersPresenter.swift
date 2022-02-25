import Foundation

protocol QuestionsAnswersPresentationLogic: AnyObject {
    func initialState()
}

final class QuestionsAnswersPresenter: QuestionsAnswersPresentationLogic {
    
    weak var viewController: QuestionsAnswersDisplayLogic?
    let provider: QuestionsAnswersProviderProtocol
    
    init(provider: QuestionsAnswersProviderProtocol) {
        self.provider = provider
    }
    
    func initialState() {
        self.viewController?.showLoading(state: true)
        provider.request(urlString: DataString.url) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case let .success(models):
                self.viewController?.showData(models: models)
            case let .failure(error):
                self.viewController?.showAlert(error: error)
            }
        }
        self.viewController?.showLoading(state: false)
    }
}
