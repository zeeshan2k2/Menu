
import SwiftUI

struct APButton: View {
    
    let title: LocalizedStringKey
    var width: CGFloat = 260
    var height: CGFloat = 50
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: width, height: height)
            .foregroundStyle(.white)
            .background(Color(.brandPrimary))
            .cornerRadius(10)
    }
}

#Preview {
    APButton(title: "Button")
}
