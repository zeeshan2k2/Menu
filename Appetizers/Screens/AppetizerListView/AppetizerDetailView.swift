//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Zeeshan Waheed on 25/04/2026.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    @EnvironmentObject var order: Order
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .frame(width: 300, height: 225)
                .cornerRadius(12)
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40) {
                    NutritionInfo(name: "Calories", count: appetizer.calories)
                    NutritionInfo(name: "Carbs", count: appetizer.carbs)
                    NutritionInfo(name: "Protein", count: appetizer.protein)
                }
            }
            
            Spacer()
            
            Button {
                print("Add to order Button tapped")
                order.addOrder(appetizer: appetizer)
            } label: {
//                APButton(
//                    title: "$\(String(format: "%.2f", appetizer.price)) - Add To Order"
//                )
                Text("$\(String(format: "%.2f", appetizer.price)) - Add To Order")
                
            }
            .modifier(StandardButtonStyle())
//            .standardButtonStyle()
            .padding(.bottom, 30)
            
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false
        } label: {
            XDismissButton()
        }, alignment: .topTrailing)
        
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(true)) .environmentObject(Order())
}


struct NutritionInfo: View {
    
    let name: String
    let count: Int
    
    var body: some View {
        VStack(spacing: 5) {
            Text(name)
                .bold()
                .font(.caption)
            
            Text("\(count) g")
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
