// iOS 16 and SwiftUI introduced presentationDetent modifier to showcase full sheet, half bottom sheet and also you can use fractioned and height to showcase 
// a sheet according your convenience

import SwiftUI

enum SheetType: CaseIterable {
    case half
    case full
    case heighted
    case fractioned
    
    var name: String {
        switch self {
        case .half:
            return "Half"
        case .full:
            return "Full"
        case .heighted:
            return "Height - 100"
        case .fractioned:
            return "Fraction - 3/4th"
        }
    }
}

struct ContentView: View {
    
    @State private var showSheet = false
    @State private var sheetType: SheetType = .half
    
    var body: some View {
        Form {
            Picker("Sheet Styles", selection: $sheetType) {
                ForEach(SheetType.allCases, id: \.self) {
                    Text($0.name)
                }
            }
            Button("Show Sheet") {
                showSheet.toggle()
            }
            .sheet(isPresented: $showSheet) {
                SheetView()
                    .presentationDetents([sheetDetent(type: sheetType)])
            }
        }
    }
    
    func sheetDetent(type: SheetType) -> PresentationDetent {
        switch type {
        case .half:
            return .medium
        case .full:
            return .large
        case .heighted:
            return .height(100)
        case .fractioned:
            return .fraction(0.75)
        }
    }
    
}

struct SheetView: View {
    var body: some View {
        VStack {
            
        }
    }
}


