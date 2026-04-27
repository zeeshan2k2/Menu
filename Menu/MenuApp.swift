
import SwiftUI

@main
struct MenuApp: App {
    
    @StateObject var orderViewModel = Order()
    
    var body: some Scene {
        WindowGroup {
            MenuTabView()
                .environmentObject(orderViewModel)
        }
    }
}
