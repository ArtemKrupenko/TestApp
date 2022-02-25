import Foundation

// MARK: - Model
struct SectionsFAQ: Codable {
    public var name: String
    public var items: [DataFAQ]
}

struct DataFAQ: Codable {
    public var question: String
    public var answer: String?
}
