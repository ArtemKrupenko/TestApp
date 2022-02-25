import UIKit

// MARK: - Protocol
protocol QuestionsAnswersProviderProtocol: AnyObject {
    func request(urlString: String, completion: @escaping ((Result<[SectionsFAQ], Error>)) -> Void)
}

// MARK: - Provider
final class QuestionsAnswersProvider: QuestionsAnswersProviderProtocol {
    
    public func request(urlString: String, completion: @escaping (Result<[SectionsFAQ], Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print(error)
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                do {
                    let result = try JSONDecoder().decode([SectionsFAQ].self, from: data)
                    completion(.success(result))
                } catch let jsonError {
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
}
