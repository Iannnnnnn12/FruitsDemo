import SwiftUI

struct ContentView: View {
    @StateObject private var store = FruitStore()
    @State private var showAddFruit = false
    @State private var newFruit = FruitStore.defaultFruit
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.fruits) { fruit in
                    NavigationLink(destination: DetailFruitView(fruit: fruit)) {
                        FruitRowView(fruit: fruit)
                    }
                }
                .onDelete(perform: store.deleteFruit)
            }
            .navigationTitle("Fruits")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        newFruit = FruitStore.defaultFruit
                        showAddFruit = true
                    } label: {
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
                            store.addFruit(fruit)
                            showAddFruit = false
                        }
                    )
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
