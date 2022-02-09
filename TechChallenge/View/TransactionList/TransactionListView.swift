//
//  TransactionListView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

struct TransactionListView: View {
    
    // MARK: Properties
    @EnvironmentObject private var viewModel: TransactionListViewModel
    var transactions: [TransactionModel] = ModelData.sampleTransactions
    @State var selectedCategory: TransactionModel.Category?
    
    var body: some View {
        VStack {
            
            FilterListView(selectedCategory: $selectedCategory)
                .onChange(of: selectedCategory) { category in
                    print(category)
                }
            
            List {
                ForEach(transactions) { transaction in
                    TransactionView(transaction: transaction)
                }
            }
            .animation(.easeIn)
            .listStyle(PlainListStyle())
            .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Transactions")
        }
    }
}

#if DEBUG
struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView()
    }
}
#endif
