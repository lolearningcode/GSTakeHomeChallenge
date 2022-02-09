//
//  FilterView.swift
//  TechChallenge
//
//  Created by Cleo Howard on 2/9/22.
//

import SwiftUI

struct FilterView: View {
    
    var category: TransactionModel.Category?
    @Binding var selectedCategory: TransactionModel.Category?
    private var backgroundColor: Color {
        let color = category?.color ?? .black
        return color.opacity(0.8)
    }
    
    var body: some View {
        Button {
            self.selectedCategory = category
        } label: {
            Text(category?.rawValue ?? "all")
                .categoryFilterFont()
                .frame(height: 18)
                .padding()
                .background(backgroundColor)
                .clipShape(Capsule())
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FilterView(selectedCategory: .constant(.entertainment))
                .padding()
                
            FilterView(category: .entertainment, selectedCategory: .constant(.entertainment))
                .padding()
            
            FilterView(category: .shopping, selectedCategory: .constant(.food))
                .padding()
        }
    }
}
