//needs description and iso code since user friendly name != iso code and can't use all iso codes in enum (e.g. "in" is a reserved keyword).

enum Countries: CustomStringConvertible {
    case argentina
    case australia
    case austria
    case belgium
    case brazil
    case bulgaria
    case canada
    case china
    case colombia
    case czechrepublic
    case egypt
    case france
    case germany
    case greece
    case hongkong
    case hungary
    case india
    case indonesia
    case ireland
    case israel
    case italy
    case japan
    case latvia
    case lithuania
    case malaysia
    case mexico
    case morocco
    case netherlands
    case newZealand
    case nigeria
    case norway
    case philippines
    case poland
    case portugal
    case romania
    case saudiarabia
    case serbia
    case singapore
    case slovakia
    case slovenia
    case southafrica
    case southkorea
    case sweden
    case switzerland
    case taiwan
    case thailand
    case turkey
    case uae
    case ukraine
    case unitedkingdom
    case unitedstates
    case venuzuela

    static let all: [Countries] = [
        .argentina, .australia, .austria, .belgium, .brazil, .bulgaria, .canada,
        .china, .colombia, .czechrepublic, .egypt, .france, .germany, .greece,
        .hongkong, .hungary, .india, .indonesia, .ireland, .israel, .italy,
        .japan, .latvia, .lithuania, .malaysia, .mexico, .morocco, .netherlands,
        .newZealand, .nigeria, .norway, .philippines, .poland, .portugal,
        .romania, .saudiarabia, .serbia, .singapore, .slovakia, .slovenia,
        .southafrica, .southkorea, .sweden, .switzerland, .taiwan, .thailand,
        .turkey, .uae, .ukraine, .unitedkingdom, .unitedstates, .venuzuela
    ]
    
    public var description: String {
            switch self {
            case .argentina:
                return "Argentina"
            case .australia:
                return "Australia"
            case .austria:
                return "Austria"
            case .belgium:
                return "Belgium"
            case .brazil:
                return "Brazil"
            case .bulgaria:
                return "Bulgaria"
            case .canada:
                return "Canada"
            case .china:
                return "China"
            case .colombia:
                return "Colombia"
            case .czechrepublic:
                return "Czech Republic"
            case .egypt:
                return "Egypt"
            case .france:
                return "France"
            case .germany:
                return "Germany"
            case .greece:
                return "Greece"
            case .hongkong:
                return "Hong Kong"
            case .hungary:
                return "Hungary"
            case .india:
                return "India"
            case .indonesia:
                return "Indonesia"
            case .ireland:
                return "Ireland"
            case .israel:
                return "Israel"
            case .italy:
                return "Italy"
            case .japan:
                return "Japan"
            case .latvia:
                return "Latvia"
            case .lithuania:
                return "Lithuania"
            case .malaysia:
                return "Malaysia"
            case .mexico:
                return "Mexico"
            case .morocco:
                return "Morocco"
            case .netherlands:
                return "Netherlands"
            case .newZealand:
                return "New Zealand"
            case .nigeria:
                return "Nigeria"
            case .norway:
                return "Norway"
            case .philippines:
                return "Philippines"
            case .poland:
                return "Poland"
            case .portugal:
                return "Portugal"
            case .romania:
                return "Romania"
            case .saudiarabia:
                return "Saudi Arabia"
            case .serbia:
                return "Serbia"
            case .singapore:
                return "Singapore"
            case .slovakia:
                return "Slovakia"
            case .slovenia:
                return "Slovenia"
            case .southafrica:
                return "South Africa"
            case .southkorea:
                return "South Korea"
            case .sweden:
                return "Sweden"
            case .switzerland:
                return "Switzerland"
            case .taiwan:
                return "Taiwan"
            case .thailand:
                return "Thailand"
            case .turkey:
                return "Turkey"
            case .uae:
                return "UAE"
            case .ukraine:
                return "Ukraine"
            case .unitedkingdom:
                return "United Kingdom"
            case .unitedstates:
                return "United States"
            case .venuzuela:
                return "Venezuela"
            }
        }
        
        public var isoCode: String {
            switch self {
            case .argentina:
                return "ar"
            case .australia:
                return "au"
            case .austria:
                return "at"
            case .belgium:
                return "be"
            case .brazil:
                return "br"
            case .bulgaria:
                return "bu"
            case .canada:
                return "ca"
            case .china:
                return "cn"
            case .colombia:
                return "co"
            case .czechrepublic:
                return "cz"
            case .egypt:
                return "eg"
            case .france:
                return "fr"
            case .germany:
                return "de"
            case .greece:
                return "gr"
            case .hongkong:
                return "hk"
            case .hungary:
                return "hu"
            case .india:
                return "in"
            case .indonesia:
                return "id"
            case .ireland:
                return "ie"
            case .israel:
                return "is"
            case .italy:
                return "it"
            case .japan:
                return "jp"
            case .latvia:
                return "lv"
            case .lithuania:
                return "lt"
            case .malaysia:
                return "my"
            case .mexico:
                return "mx"
            case .morocco:
                return "md"
            case .netherlands:
                return "nl"
            case .newZealand:
                return "nz"
            case .nigeria:
                return "ng"
            case .norway:
                return "no"
            case .philippines:
                return "ph"
            case .poland:
                return "pl"
            case .portugal:
                return "pt"
            case .romania:
                return "ro"
            case .saudiarabia:
                return "sa"
            case .serbia:
                return "rs"
            case .singapore:
                return "sg"
            case .slovakia:
                return "sk"
            case .slovenia:
                return "si"
            case .southafrica:
                return "za"
            case .southkorea:
                return "kr"
            case .sweden:
                return "se"
            case .switzerland:
                return "ch"
            case .taiwan:
                return "tw"
            case .thailand:
                return "th"
            case .turkey:
                return "tr"
            case .uae:
                return "ae"
            case .ukraine:
                return "ua"
            case .unitedkingdom:
                return "gb"
            case .unitedstates:
                return "us"
            case .venuzuela:
                return "ve"
            }
        }
}

