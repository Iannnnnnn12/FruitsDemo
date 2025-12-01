
import SwiftUI

//TODO: Create a list
//TODO: Create the navigation
struct ContentView: View {
    @StateObject private var store = FruitStore()
    @State private var newFruit = FruitStore.defaultFruit
    
    var body: some View {
        NavigationView{
            List{
                ForEach(store.fruits) { fruit in
                    NavigationLink(destination: DetailFruitView(fruit: fruit)){
                        FruitRowView(fruit: fruit)
                    }
                }
                .onDelete(perform: deleteFruit)
            }
            .navigationTitle("Fruits")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddFruitView(newFruit: $newFruit) { fruit in
                        store.fruits.append(fruit)
                        newFruit = FruitStore.defaultFruit
                    }) {
                        Text("+")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                }
            }

        }
    }
    
    func deleteFruit(at offsets: IndexSet) {
        store.fruits.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
