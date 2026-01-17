//Ideal world this would come from an API endpoint listing available categories
enum Categories: String, CaseIterable {
    case general
    case business
    case entertainment
    case health
    case science
    case sports
    case technology
}

// no need for extended description as categories are self explanatory
