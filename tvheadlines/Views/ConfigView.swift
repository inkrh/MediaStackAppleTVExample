import SwiftUI

struct ConfigView: View {
    @Bindable private var config = Config.shared

    private var selectedCountry: Binding<Countries> {
        Binding<Countries>(
            get: {
                Countries.all.first(where: { $0.isoCode == config.countries })
                ?? .unitedstates
            },
            set: { newValue in
                config.countries = newValue.isoCode
            }
        )
    }

    private var selectedCategory: Binding<Categories> {
        Binding<Categories>(
            get: {
                Categories.allCases.first(where: { $0.rawValue == config.categories })
                ?? .science
            },
            set: { newValue in
                config.categories = newValue.rawValue
            }
        )
    }

    // Helper for Languages
    private var selectedLanguage: Binding<Languages> {
        Binding<Languages>(
            get: {
                Languages.all.first(where: { $0.rawValue == config.languages })
                ?? .en
            },
            set: { newValue in
                config.languages = newValue.rawValue
            }
        )
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Categories")) {
                    Picker("Category", selection: selectedCategory) {
                        ForEach(Categories.allCases, id: \.rawValue) { category in
                            Text(category.rawValue.capitalized)
                                .tag(category)
                        }
                    }
                }
                Section(header: Text("Countries")) {
                    Picker("Country", selection: selectedCountry) {
                        ForEach(Countries.all, id: \.isoCode) { country in
                            Text(country.description)
                                .tag(country)
                        }
                    }
                }
                Section(header: Text("Languages")) {
                    Picker("Language", selection: selectedLanguage) {
                        ForEach(Languages.all, id: \.rawValue) { language in
                            Text(language.description)
                                .tag(language)
                        }
                    }
                }
            }
            .navigationTitle("Configuration")
        }
    }
}
