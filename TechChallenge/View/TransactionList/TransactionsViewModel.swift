//
//  TransactionsViewModel.swift
//  TechChallenge
//
//  Created by Cleo Howard on 2/9/22.
//

import Foundation
import Combine

final class TransactionViewModel: ObservableObject {
    @Published var selectedCategory: TransactionModel.Category?
    @Published var transactionsSum: Double = 0
    @Published var filteredSortedTransactions: [TransactionModel] = ModelData.sampleTransactions
    @Published var pinnedTransactions: [TransactionModel] = ModelData.sampleTransactions
    @Published var unpinnedTransactions: Set<TransactionModel> = []
    
    private let transactions: [TransactionModel]
    
    // MARK: INIT
    init(transactions: [TransactionModel], selectedCategory: TransactionModel.Category? = nil) {
        self.transactions = transactions
        self.selectedCategory = selectedCategory
    }
    
    // MARK: - METHODS
    /// Pin and unpin selected transactions
    func pinOrUnpinTransactions(_ transaction: TransactionModel) {
        if unpinnedTransactions.contains(transaction) {
            unpinnedTransactions.remove(transaction)
        } else {
            unpinnedTransactions.insert(transaction)
        }
        
        updatePinnedTransactions()
        updateTransactionsList(for: selectedCategory)
        updateTransactionsListSum(for: selectedCategory)
    }
    
    /// Update the filtered transaction according to selected category
    func updateTransactionsList(for category: TransactionModel.Category?) {
        if let category = category {
            filteredSortedTransactions = transactions
                .filter { $0.category == category }
        } else {
            filteredSortedTransactions = transactions
        }
    }
    
    /// Update pinned transactions to be displayed in InsightsView
    func updatePinnedTransactions() {
        pinnedTransactions = transactions
            .filter { !unpinnedTransactions.contains($0) }
    }
    
    /// Get pinned transactions sum for selected category
    func getTransactionSum(for category: TransactionModel.Category?) -> Double {
        return transactions
            .filter { $0.category == category }
            .filter { !unpinnedTransactions.contains($0) }
            .reduce(0) { $0 + $1.amount }
    }
    
    /// Update the transactions list sum with the category that's selected
    func updateTransactionsListSum(for category: TransactionModel.Category?) {
        if let category = category {
            transactionsSum = getTransactionSum(for: category)
        } else {
            transactionsSum = transactions
                .filter { !unpinnedTransactions.contains($0) }
                .reduce(0) { $0 + $1.amount }
        }
    }
}
