//
//  TechChallengeTests.swift
//  TechChallengeTests
//
//  Created by Adrian Tineo Cabello on 30/7/21.
//

import XCTest
@testable import TechChallenge

class TechChallengeTests: XCTestCase {

    var sut: TransactionViewModel!

    override func setUp() {
        sut = TransactionViewModel(transactions: ModelData.sampleTransactions)
    }
    
    override func tearDown() {
        sut = nil
    }
    
    // MARK: - Category Selection Tests
    func test_ViewModel_WhenCategoryIsSelected_ShouldProvideSelectedCategorysTransactions() {
        // Arrange
        let entertainmentTransactions = [ModelData.sampleTransactions[0]]
        let selectedCategory = TransactionModel.Category.entertainment
        
        // Act
        sut.updateTransactionsList(for: selectedCategory)
        
        // Assert
        XCTAssertTrue(sut.filteredSortedTransactions.count == 1, "Only 1 entertainment transaction")
        XCTAssertEqual(sut.filteredSortedTransactions, entertainmentTransactions, "Filtered transactions should return only entertainment transactions when category button is selected.")
    }
    
    func test_ViewModel_GivenTransactionsWhenCategoryIsSelected_ShouldProvideTheSumOfAllTransactions() {
        // Arrange
        let transactionSum: Int = 82
        let selectedCategory = TransactionModel.Category.entertainment
        
        // Act
        sut.updateTransactionsListSum(for: selectedCategory)
        
        // Assert
        XCTAssertEqual(Int(sut.transactionsSum), transactionSum, "Transaction sum is valid.")
    }
}
