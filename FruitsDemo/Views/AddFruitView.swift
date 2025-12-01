
import SwiftUI

struct AddFruitView: View {
    
    @Binding var newFruit:Fruit
    var existingFruits: [Fruit]
    var onAdd: (Fruit) -> Void
    @Environment(\.presentationMode) var presentationMode

    
    var body: some View {
        Form {
            Section(header: Text("Name")) {
                Text(newFruit.name)
            }
            Section(header: Text("Description")) {
                TextEditor(text: $newFruit.description)
            }
            Section(header: Text("Image")) {
                EmojiPicker(emoji: $newFruit.emoji)
                    .onChange(of: newFruit.emoji) { newEmoji in
                        newFruit.name = newEmoji.defaultName
                    }
                    //TODO: .listRowInsets(EdgeInsets())
            }
        }
        .navigationTitle("Add Fruit")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Add") {
                    onAdd(newFruit)
                    presentationMode.wrappedValue.dismiss()
                }
                .disabled(newFruit.name.trimmingCharacters(in: .whitespaces).isEmpty ||
                    existingFruits.contains(where: { $0.emoji == newFruit.emoji })
            )}
        }
    }
}

struct AddFruitView_Previews: PreviewProvider {
    static var previews: some View {
        AddFruitView(newFruit: .constant(FruitStore.defaultFruit), existingFruits: [],onAdd: { _ in })
        AddFruitView(newFruit: .constant(FruitStore.defaultFruit), existingFruits: [],onAdd: { _ in })
            .preferredColorScheme(.dark)
        AddFruitView(newFruit: .constant(FruitStore.defaultFruit), existingFruits: [],onAdd: { _ in })
            .previewLayout(.fixed(width: 480, height: 320))
    }
}
