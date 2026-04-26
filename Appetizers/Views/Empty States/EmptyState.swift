//
//  EmptyState.swift
//  Appetizers
//
//  Created by Zeeshan Waheed on 26/04/2026.
//

import SwiftUI

struct EmptyState: View {
    
    let image: ImageResource
    let message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding()
            }
            .offset(y: -40)
        }
    }
}

#Preview {
    EmptyState(image: .emptyOrder, message: "You have no items in your order.")
}
