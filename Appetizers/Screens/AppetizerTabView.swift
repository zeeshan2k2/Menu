//
//  ContentView.swift
//  Appetizers
//
//  Created by Zeeshan Waheed on 22/04/2026.
//

import SwiftUI

struct AppetizerTabView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            AppetizerListView()
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
    AppetizerTabView()
        .environmentObject(Order())
}
