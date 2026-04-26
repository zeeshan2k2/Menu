//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by Zeeshan Waheed on 23/04/2026.
//

import SwiftUI

struct AppetizerListCell: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
//            // Needed when caching is required
//            AppetizerRemoteImage(urlString: appetizer.imageURL)
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 120, height: 90)
//                .cornerRadius(8)
            
            // When cache isnt required and it is the modern way
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image
                    .imageListStyle()
            } placeholder: {
                Image(.foodPlaceholder)
                    .imageListStyle()
            }

            
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizer)
}
