// Native Share Sheet in SwiftUI which can also be used with `presentationDetents`

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 14) {
            SwiftAnytimeView()
            Text("Like our work? Share with your friends!")
                .font(.title3.bold())
            ShareLink(item: URL(string: "https://www.swiftanytime.com")!) {
                LabelView()
            }.presentationDetents([.medium])
        }
    }
}

struct SwiftAnytimeView: View {
    var body: some View {
        Image("logo")
            .resizable()
            .scaledToFit()
            .frame(width: 128, height: 128)
    }
}

struct LabelView: View {
    var body: some View {
        Text("Share")
            .frame(width: 60, height: 10)
            .font(.headline)
            .foregroundColor(.orange)
            .padding()
            .background(Color.orange.opacity(0.1))
            .clipShape(Capsule())
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
