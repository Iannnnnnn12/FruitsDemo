import Foundation
class FruitStore:ObservableObject{
    
    @Published private(set) var fruits: [Fruit] = FruitStore.defaultFruits
    
    func addFruit(_ fruit: Fruit) {
        guard !fruits.contains(where: { $0.emoji == fruit.emoji }) else { return }
        fruits.append(fruit)
    }
        
    func deleteFruit(at offsets: IndexSet) {
        fruits.remove(atOffsets: offsets)
    }
    
    static let defaultFruits = [
        Fruit(name: "Apple", emoji: .apple, description: "Apples help your body develop resistance against infections"),
        Fruit(name: "Pineapple", emoji: .pineapple, description: "Pineapples help fight arthritis"),
        Fruit(name: "Watermelon", emoji: .watermelon, description: "Watermelon helps control your heart rate"),
    ]
    
    static let defaultFruit =  Fruit(name: "Watermelon", emoji: .watermelon, description: "")
    
}
