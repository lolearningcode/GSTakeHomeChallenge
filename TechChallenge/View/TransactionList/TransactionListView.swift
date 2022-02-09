//
//  TransactionListView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

struct TransactionListView: View {
    
    // MARK: Properties
    @EnvironmentObject var viewModel: TransactionViewModel
    
    var body: some View {
        VStack {
            // Transactions Filter
            FilterListView(selectedCategory: $viewModel.selectedCategory)
                .onChange(of: viewModel.selectedCategory) { category in
                    viewModel.updateTransactionsList(for: category)
                    viewModel.updateTransactionsListSum(for: category)
                }
            
            // Transaction List
            List {
                ForEach(viewModel.filteredSortedTransactions) { transaction in
                    TransactionView(transaction: transaction,
                                    isPinned: !viewModel.unpinnedTransactions.contains(transaction))
                        .onTapGesture {
                            viewModel.pinOrUnpinTransactions(transaction)
                        }
                }
            }
            .animation(.easeIn)
            .listStyle(PlainListStyle())
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Transactions")
        }
        .onAppear {
            viewModel.updateTransactionsListSum(for: viewModel.selectedCategory)
            viewModel.updateTransactionsList(for: viewModel.selectedCategory)
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
