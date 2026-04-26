//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Zeeshan Waheed on 23/04/2026.
//

import SwiftUI
internal import Combine

// basiclly it runs on the main thread such that we dont have to do the DispatchQueue.main.async separately
@MainActor final class AppetizerListViewModel: ObservableObject {
    
    // broadcasts its changes using @Published
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
    
//    // Old code
//    func getAppetizers() {
//        
//        isLoading = true
//        
//        NetworkManager.shared.getAppetizers { result in
//            // since UI updates are on the main thread and updating the appetizers variable will trigger and UI update on the view we swtich to main thread for this
//            DispatchQueue.main.async { [self] in
//                // we're done loading as soon as we're on the main thread for UI
//                isLoading = false
//                switch result {
//                case .success(let appetizers):
//                    self.appetizers = appetizers
//                case .failure(let error):
//                    switch error {
//                    case .invalidData:
//                        alertItem = AlertContext.invalidData
//                    case .invalidURL:
//                        alertItem = AlertContext.invalidURL
//                    case .invalidResponse:
//                        alertItem = AlertContext.invalidResponse
//                    case .unableToComplete:
//                        alertItem = AlertContext.unableToComplete
//                    }
//                    print(error.localizedDescription)
//                }
//            }
//        }
//    }
    
    
    func getAppetizers() {
        
        isLoading = true
        
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch {
                if let apError = error as? APError {
                    switch apError {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                } else {
                    alertItem = AlertContext.invalidResponse
                }
                isLoading = true
            }
        }
    }
}

