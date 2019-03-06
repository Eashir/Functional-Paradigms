import UIKit

let myRecentTransactions = [ 4.99, 112.07, 125.74, 19.99, 3.15, 288.6, 114.18, 33.19 ]

var isExpensive: (Double) -> Bool = { (value) in
	return value > 100
}


func expensiveTransactionFilter(transactions: [Double], operation: (Double) -> Bool) -> [Double] {
	var expensiveTransactions: [Double] = []
	
	for transaction in transactions {
		if operation(transaction) {
			expensiveTransactions.append(transaction)
		} else {
			print("Not an expensive transaction")
		}
	}
	
	return expensiveTransactions
}


expensiveTransactionFilter(transactions: myRecentTransactions, operation: isExpensive)
expensiveTransactionFilter(transactions: myRecentTransactions) { transaction in return transaction > 100 }


func genericFilter<T>(array: [T], operation: (T) -> Bool) -> [T] {
	var results: [T] = []
	
	for element in array {
		if operation(element) {
			results.append(element)
		}
	}
	
	return results
}

let myExpensiveTransactions = genericFilter(array: myRecentTransactions, operation: { $0 > 100 })
print(myExpensiveTransactions)
