//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Zeeshan Waheed on 22/04/2026.
//

import SwiftUI

struct AppetizerListView: View {
    
    // If ure passing the viewmodel from previous view use @ObservedObject
    // If you're Initializing ur viewmodel use StateObject
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
//                        .listRowSeparator(.hidden)
//                        .listRowSeparatorTint(.brandPrimary)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetail = true
                        }
                }
                .navigationTitle("Appetizers")
                .disabled(viewModel.isShowingDetail ? true : false)
            }
//            .onAppear {
//                viewModel.getAppetizers()
//            }
            // puts u in the async context
            .task {
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            if viewModel.isShowingDetail {
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer ?? MockData.sampleAppetizer, isShowingDetail: $viewModel.isShowingDetail)
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
    AppetizerListView()
}
