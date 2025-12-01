import Foundation

struct Fruit: Hashable, Identifiable{
    var id: some Hashable{name}
    var name:String
    var emoji:EmojiFruit
    var description:String
}

enum EmojiFruit:String, CaseIterable {
  case apple = "🍎"
  case banana = "🍌"
  case coco =  "🥥"
  case grape = "🍇"
  case kiwi = "🥝"
  case lemon = "🍋"
  case orange = "🍊"
  case pear = "🍐"
  case pineapple = "🍍"
  case strawberry = "🍓"
  case watermelon = "🍉"
    
    var defaultName: String {
            switch self {
            case .apple: return "Apple"
            case .banana: return "Banana"
            case .coco: return "Coconut"
            case .grape: return "Grape"
            case .kiwi: return "Kiwi"
            case .lemon: return "Lemon"
            case .orange: return "Orange"
            case .pear: return "Pear"
            case .pineapple: return "Pineapple"
            case .strawberry: return "Strawberry"
            case .watermelon: return "Watermelon"
            }
        }
}
