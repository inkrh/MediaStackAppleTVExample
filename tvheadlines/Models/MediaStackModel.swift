//   let mediaStackModel = try? JSONDecoder().decode(MediaStackModel.self, from: jsonData)

import Foundation

//TODO: change source - quality of source articles at present using general results is more suited to clickbait text sites (e.g. "Ten things to pack on holiday", "Description of ten random things", Possibly an image ) rather than TV (e.g. "Actual news headline", "Brief relevant description", Image/Video). Not reliable as to what will be returned.

// MARK: - MediaStackModel
struct MediaStackModel: Codable {
    let pagination: Pagination
    let data: [Datum]
}
import Foundation

// MARK: - Datum
struct Datum: Codable {
    let category: String
    let source, title: String
    let url: String
    let publishedAt: String
    let author: String?
    let image: String?
    let description: String
    let language: String
    let country: String

    enum CodingKeys: String, CodingKey {
        case category, source, title, url
        case publishedAt = "published_at"
        case author, image, description, language, country
    }
}



// MARK: - Pagination
struct Pagination: Codable {
    let limit, count, offset, total: Int
}

var TestData: MediaStackModel = MediaStackModel(
    pagination: Pagination(limit: 1, count: 1, offset: 1, total: 1),
    data: [
        Datum(
            category: "general",
            source: "title",
            title: "description",
            url: "https://some.url",
            publishedAt: Date().description, // <- Fixed: use current date
            author: "Some author",
            image: "https://some.url/image.png",
            description: "description",
            language: "en",
            country: "us"
        )
    ]
)
