// During WWDC21, Apple introduced a new modifier .refreshable  you to showcase ProgressView and reloads with an action to perform like networking request. 
// Here’s how you it works.

import SwiftUI

struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let email: String
}

struct ContentView: View {
    
    @State private var users: [User] = [
        User(id: 0, name: "Tim Jobs", email: "tim@jobs.com")
    ]
    
    var body: some View {
        NavigationView {
            List(users) { user in
                ListRowView(user: user)
            }
            .refreshable {
                await loadUsers()
            }
            .navigationTitle("My App")
        }
    }
    
    func loadUsers() async {
        do {
            let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
            let (data, _) = try await URLSession.shared.data(from: url)
            users = try JSONDecoder().decode([User].self, from: data)
        } catch {
            users = []
        }
    }
    
}

struct ListRowView: View {
    
    let user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(user.name)
                .font(.headline)
            Text(user.email)
                .foregroundColor(.secondary)
        }
    }
    
}
