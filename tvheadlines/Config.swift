//
//  Config.swift
//  tvheadlines
//
//  Created by Robert Smith on 12/26/25.
//

import Foundation
import Observation

@Observable
class Config {
    static let shared = Config()

    // UserDefaults keys
    private let categoriesKey = "categories"
    private let countriesKey = "countries"
    private let languagesKey = "languages"

    // Default values
    private let defaultCategories = Categories.science.rawValue
    private let defaultCountries = Countries.unitedstates.isoCode
    private let defaultLanguages = Languages.en.rawValue

    //access key - TODO: get from mediastack, set in CICD
    var accessKey = "<YOUR API KEY SET AT BUILD TIME USING CICD VARIABLE>"

    var categories: String {
        didSet { UserDefaults.standard.set(categories, forKey: categoriesKey) }
    }
    var countries: String {
        didSet { UserDefaults.standard.set(countries, forKey: countriesKey) }
    }
    var languages: String {
        didSet { UserDefaults.standard.set(languages, forKey: languagesKey) }
    }

    init() {
        self.categories = UserDefaults.standard.string(forKey: categoriesKey) ?? defaultCategories
        self.countries = UserDefaults.standard.string(forKey: countriesKey) ?? defaultCountries
        self.languages = UserDefaults.standard.string(forKey: languagesKey) ?? defaultLanguages
    }

    var BASE_API: String {
        "https://api.mediastack.com/v1/news?access_key=\(accessKey)&categories=\(categories)&countries=\(countries)&languages=\(languages)"
    }
}
