//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Zeeshan Waheed on 22/04/2026.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    @StateObject var orderViewModel = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView()
                .environmentObject(orderViewModel)
        }
    }
}
