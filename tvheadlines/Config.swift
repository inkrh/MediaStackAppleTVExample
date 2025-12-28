class Config {
    let accessKey = "<API KEY HERE>"
    let categories = "science"
    let countries = "us"
    let languages = "en"
    var BASE_API: String {
        "https://api.mediastack.com/v1/news?access_key=\(accessKey)&categories=\(categories)&countries=\(countries)&languages=\(languages)"
    }
}
