//
//  TransactionsViewModel.swift
//  TechChallenge
//
//  Created by Cleo Howard on 2/9/22.
//

import Foundation
import Combine

extension TransactionListView {
    final class TransactionListViewModel: ObservableObject {
        @Published var selectedCategory: TransactionModel.Category?
    }
}
