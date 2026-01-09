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
            source: "source info",
            title: "A short title average about this long, some longer, some not.",
            url: "https://some.url",
            publishedAt: Date().description, // <- Fixed: use current date
            author: "Some author",
            image: "https://inkrh.com/images/screen-0604.tif",
            description: "A longer description, with many words with information. This is just an example to show how the description field can be filled. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque dictum urna ac arcu luctus, a feugiat est venenatis. Praesent tincidunt id nunc sed ultrices. Aliquam pellentesque quam ac nunc ullamcorper ornare. Nunc vel dui ullamcorper ipsum fringilla ornare eget vel libero. Aliquam placerat magna enim. Donec placerat dapibus placerat. Quisque eu massa eget nisl pulvinar hendrerit sit amet eget purus. Pellentesque eu nunc est. Nulla hendrerit tortor augue, quis porta ligula hendrerit nec. Maecenas fringilla mi id gravida dignissim. Sed justo est, fringilla id placerat vitae, euismod et lorem. Curabitur tincidunt laoreet felis, id molestie odio faucibus sed. Phasellus porttitor, orci nec consectetur cursus, lacus erat congue risus, nec sagittis ipsum mi id metus. Ut efficitur tincidunt neque. Cras rutrum mi non risus aliquet sagittis. Donec at lectus sed dui egestas tincidunt et non felis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nulla venenatis, arcu vitae porta dignissim, ante metus ullamcorper ex, a pharetra odio leo vitae mi. Duis ornare magna id libero auctor, et feugiat leo maximus. Donec est sapien, elementum et orci placerat, gravida lacinia nunc. Sed rutrum semper arcu, vitae pretium lectus fermentum quis.",
            language: "en",
            country: "us"
        )
    ]
)
