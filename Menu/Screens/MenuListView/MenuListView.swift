
import SwiftUI

struct MenuListView: View {
    
    // If ure passing the viewmodel from previous view use @ObservedObject
    // If you're Initializing ur viewmodel use StateObject
    @StateObject var viewModel = MenuListViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.menu) { menuItem in
                    MenuListCell(menuItem: menuItem)
//                        .listRowSeparator(.hidden)
//                        .listRowSeparatorTint(.brandPrimary)
                        .onTapGesture {
                            viewModel.selectedMenuItem = menuItem
                            viewModel.isShowingDetail = true
                        }
                }
                .navigationTitle("Menu")
                .disabled(viewModel.isShowingDetail ? true : false)
            }
//            .onAppear {
//                viewModel.getMenu()
//            }
            // puts u in the async context
            .task {
                viewModel.getMenuItems()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            if viewModel.isShowingDetail {
                MenuDetailView(menuItem: viewModel.selectedMenuItem ?? MockData.sampleMenuItem, isShowingDetail: $viewModel.isShowingDetail)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(
                title: alertItem.title,
                message: alertItem.message,
                dismissButton: alertItem.dismissButton
            )
            
        }
    }
    
}

#Preview {
    MenuListView()
}
