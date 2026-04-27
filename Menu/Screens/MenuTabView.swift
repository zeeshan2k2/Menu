
import SwiftUI

struct MenuTabView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            MenuListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
                .badge(order.orders.count)
        }
    }
}

#Preview {
    MenuTabView()
        .environmentObject(Order())
}
