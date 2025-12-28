//
//  Welcome.swift
//  tvheadlines
//
//  Created by Robert Smith on 12/26/25.
//

//   let mediaStackModel = try? JSONDecoder().decode(MediaStackModel.self, from: jsonData)

import Foundation

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
