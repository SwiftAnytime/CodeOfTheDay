import SwiftUI

// During WWDC21, Apple introduced a new modifier .searchable that helps you to show a search bar on your app. 
// Here’s how you can add the searchable modifier in your app.

struct ContentView: View {
    
    let developers = ["Rod", "Mac", "Stewart", "Lisa", "Andrea", "Steve", "Julia", "Chris", "Penelope"]
    
    var filteredDevelopers: [String] {
        if searchText.isEmpty {
            return developers
        } else {
            return developers.filter { $0.contains(searchText) }
        }
    }
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredDevelopers, id: \.self) { name in
                    Text(name)
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("My App")
        }
    }
}
