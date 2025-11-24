
import SwiftUI

//TODO: Create a list
//TODO: Create the navigation
struct ContentView: View {
    @StateObject private var store = FruitStore()
    @State private var showAddFruit = false
    @State private var newFruit = FruitStore.defaultFruit
    
    var body: some View {
        NavigationView{
            List{
                ForEach(store.fruits) { fruit in
                    NavigationLink(destination: DetailFruitView(fruit: fruit)){
                        FruitRowView(fruit: fruit)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
