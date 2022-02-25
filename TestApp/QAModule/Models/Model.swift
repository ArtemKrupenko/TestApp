import Foundation

// MARK: - Model
struct SectionsFAQ: Decodable {
    public var name: String
    public var items: [DataFAQ]
}

struct DataFAQ: Decodable {
    public var question: String
    public var answer: String?
}
