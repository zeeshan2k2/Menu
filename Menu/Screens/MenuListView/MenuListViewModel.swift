
import SwiftUI
internal import Combine

// basiclly it runs on the main thread such that we dont have to do the DispatchQueue.main.async separately
@MainActor final class MenuListViewModel: ObservableObject {
    
    // broadcasts its changes using @Published
    @Published var menu: [MenuItem] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedMenuItem: MenuItem?
    
//    // Old code
//    func getMenu() {
//
//        isLoading = true
//        
//        NetworkManager.shared.getMenu { result in
//            // since UI updates are on the main thread and updating the menu variable will trigger and UI update on the view we swtich to main thread for this
//            DispatchQueue.main.async { [self] in
//                // we're done loading as soon as we're on the main thread for UI
//                isLoading = false
//                switch result {
//                case .success(let menu):
//                    self.menu = menu
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
    
    
    func getMenuItems() {
        
        isLoading = true
        
        Task {
            do {
                menu = try await NetworkManager.shared.getMenuItems()
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

