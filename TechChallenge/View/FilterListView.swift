//
//  FilterListView.swift
//  TechChallenge
//
//  Created by Cleo Howard on 2/9/22.
//

import SwiftUI

struct FilterListView: View {
    @Binding var selectedCategory: TransactionModel.Category?
    private let categories = TransactionModel.Category.allCases
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack {
                // No category filter
                FilterView(selectedCategory: $selectedCategory)
                
                // With Category filter
                ForEach(categories) { category in
                    FilterView(category: category, selectedCategory: $selectedCategory)
                }
            }
            .padding()
            .background(Color.gray)
        }
    }
}

struct FilterListView_Previews: PreviewProvider {
    static var previews: some View {
        FilterListView(selectedCategory: .constant(.entertainment))
    }
}
