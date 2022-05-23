import SwiftUI

// In SwiftUI 3.0, Apple introduced AsyncImage view to render images from remote url. 
// Here’s how you can use it in your app with a placeholder until your image is loaded.

struct Thumbnail: Codable, Identifiable {
    let albumId: Int
    let id: Int
    let url: String
}

struct ContentView: View {
    
    @State private var thumbnails: [Thumbnail] = []
    
    var body: some View {
        NavigationView {
            List(thumbnails) { thumbnail in
                HStack {
                    AsyncImage(url: URL(string: thumbnail.url)!, content: { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 72, height: 72)
                    }) {
                        PlaceholderView()
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 13))
                    Text("Image \(thumbnail.id)")
                }
            }
            .navigationTitle("My App")
        }
        .task {
            Task {
                await loadThumbnails()
            }
        }
    }
    
    func loadThumbnails() async {
        do {
            let url = URL(string: "https://jsonplaceholder.typicode.com/photos")!
            let (data, _) = try await URLSession.shared.data(from: url)
            thumbnails = try JSONDecoder().decode([Thumbnail].self, from: data)
        } catch {
            thumbnails = []
        }
    }
    
}

struct PlaceholderView: View {
    var body: some View {
        ZStack {
            ProgressView()
        }
        .frame(width: 72, height: 72)
        .background(Color.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 13))
    }
}
