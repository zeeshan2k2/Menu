//
//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Zeeshan Waheed on 22/04/2026.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {

        NavigationView {
            
            ZStack {
                
                VStack {
                    
                    List {
                        ForEach(order.orders) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(.insetGrouped)
                    
                    Button() {
                        print("Placing order \n \(order.orders)")
                    } label: {
                        APButton(
                            title: "$\(String(format: "%.2f", order.totalPrice)) - Place Order",
                            width: 350,
                            height: 50
                        )
                    }
                    .padding(.bottom, 25)
                }
                
                if order.orders.isEmpty {
                    EmptyState(image: .emptyOrder, message: "You have no items in your order.")
                }
            }
        }
        .navigationTitle("Orders")
    }
}

#Preview {
    OrderView()
        .environmentObject(Order())
}
