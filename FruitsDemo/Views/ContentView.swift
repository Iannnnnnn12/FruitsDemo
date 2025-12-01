
import SwiftUI

//TODO: Create a list
//TODO: Create the navigation
struct ContentView: View {
    @StateObject private var store = FruitStore()
    @State private var showAddFruit = false
    @State private var newFruit = Fruit(name: "", emoji: .apple, description: "")
    
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
                    Button (action: {
                        newFruit = Fruit(name: "Apple", emoji: .apple, description: "")
                        showAddFruit = true
                    }) {
                        Text("+")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                }
            }
            .sheet(isPresented: $showAddFruit) {
                NavigationView {
                    AddFruitView(
                        newFruit: $newFruit,
                        existingFruits: store.fruits,
                        onAdd: { fruit in
                            store.fruits.append(fruit)
                            newFruit = FruitStore.defaultFruit
                            showAddFruit = false
                        }
                    )
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
