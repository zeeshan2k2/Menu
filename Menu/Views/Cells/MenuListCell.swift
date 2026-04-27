
import SwiftUI

struct MenuListCell: View {
    
    let menuItem: MenuItem
    
    var body: some View {
        HStack {
//            // Needed when caching is required
//            MenuItemRemoteImage(urlString: menuItem.imageURL)
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 120, height: 90)
//                .cornerRadius(8)
            
            // When cache isnt required and it is the modern way
            AsyncImage(url: URL(string: menuItem.imageURL)) { image in
                image
                    .imageListStyle()
            } placeholder: {
                Image(.foodPlaceholder)
                    .imageListStyle()
            }

            
            VStack(alignment: .leading, spacing: 5) {
                Text(menuItem.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(menuItem.price, specifier: "%.2f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    MenuListCell(menuItem: MockData.sampleMenuItem)
}
