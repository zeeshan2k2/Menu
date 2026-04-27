
import Foundation
import SwiftUI
internal import Combine

final class Order: ObservableObject {
    
    @Published var orders: [MenuItem] = []
    
    var totalPrice: Double {
        orders.reduce(0) { $0 + $1.price }
    }

    func addOrder(menuItem: MenuItem) {
        orders.append(menuItem)
    }
    
    func deleteItems(at offsets: IndexSet) {
        orders.remove(atOffsets: offsets)
    }
    
}

