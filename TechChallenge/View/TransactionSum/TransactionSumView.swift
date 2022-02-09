//
//  TransactionSumView.swift
//  TechChallenge
//
//  Created by Cleo Howard on 2/9/22.
//

import SwiftUI

struct TransactionSumView: View {
    let selectedCategory: TransactionModel.Category?
    let price: Double
    
    private var category: String { selectedCategory?.rawValue ?? "all" }
    private var categoryColor: Color { selectedCategory?.color ?? .black }
    
    var body: some View {
        VStack(alignment: .trailing) {
            // Selected category label
            Text(category)
                .foregroundColor(categoryColor)
                .font(.headline)
            
            //Total spent stack
            HStack {
                Text("Total spent:")
                    .secondary()
                
                Spacer()
                
                Text("$\(price.formatted())")
                    .bold()
                    .secondary()
            }
        }
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.accentColor, lineWidth: 2))
    }
}

// MARK: - PREVIEWS
#if DEBUG
struct TransactionSumView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionSumView(selectedCategory: .health, price: 232.33)
            .padding()
    }
}
#endif
