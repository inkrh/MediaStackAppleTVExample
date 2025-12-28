enum Languages: String {
    case ar
    case de
    case en
    case es
    case fr
    case he
    case it
    case nl
    case no
    case pt
    case ru
    case se
    case zh
    
    static let all: [Languages] = [
        .ar, .de, .en, .es, .fr, .he, .it, .nl, .no, .pt, .ru, .se, .zh
    ]
    
    public var description: String {
        switch self {
            case .ar: return "Arabic"
            case .de: return "German"
            case .en: return "English"
            case .es: return "Spanish"
            case .fr: return "French"
            case .he: return "Hebrew"
            case .it: return "Italian"
            case .nl: return "Dutch"
            case .no: return "Norwegian"
            case .pt: return "Portuguese"
            case .ru: return "Russian"
            case .se: return "Swedish"
            case .zh: return "Chinese"
        }
    }
}
