
import SwiftUI

struct MenuDetailView: View {
    
    let menuItem: MenuItem
    @Binding var isShowingDetail: Bool
    @EnvironmentObject var order: Order
    
    var body: some View {
        VStack {
            MenuItemRemoteImage(urlString: menuItem.imageURL)
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 225)
                .cornerRadius(12)
            
            VStack {
                Text(menuItem.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(menuItem.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40) {
                    NutritionInfo(name: "Calories", value: "\(menuItem.calories)")
                    NutritionInfo(name: "Carbs", value: "\(menuItem.carbs) g")
                    NutritionInfo(name: "Protein", value: "\(menuItem.protein) g")
                }
            }
            
            Spacer()
            
            Button {
                print("Add to order Button tapped")
                order.addOrder(menuItem: menuItem)
            } label: {
                APButton(
                    title: "$\(String(format: "%.2f", menuItem.price)) - Add To Order"
                )
//                Text("$\(String(format: "%.2f", menuItem.price)) - Add To Order")
                
            }
//            .modifier(StandardButtonStyle())
//            .standardButtonStyle()
            .padding(15)
            
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false
        } label: {
            XDismissButton()
        }, alignment: .topTrailing)
        
    }
}

#Preview {
    MenuDetailView(menuItem: MockData.sampleMenuItem, isShowingDetail: .constant(true)) .environmentObject(Order())
}


struct NutritionInfo: View {
    
    let name: String
    let value: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(name)
                .bold()
                .font(.caption)
            
            Text(value)
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
