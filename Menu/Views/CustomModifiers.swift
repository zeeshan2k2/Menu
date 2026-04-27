
import Foundation
import SwiftUI

struct StandardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
    
}

extension View {
    func standardButtonStyle() -> some View {
        self.modifier(StandardButtonStyle())
    }
}

extension Image {
    func imageListStyle() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 90)
            .cornerRadius(8)
    }
}
