//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Zeeshan Waheed on 25/04/2026.
//

import Foundation
import SwiftUI
internal import Combine

final class Order: ObservableObject {
    
    @Published var orders: [Appetizer] = []
    
    var totalPrice: Double {
        orders.reduce(0) { $0 + $1.price }
    }

    func addOrder(appetizer: Appetizer) {
        orders.append(appetizer)
    }
    
    func deleteItems(at offsets: IndexSet) {
        orders.remove(atOffsets: offsets)
    }
    
}

