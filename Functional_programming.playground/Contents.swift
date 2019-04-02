import UIKit


// MARK: - Custom Operation Filter

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

let now = Date()
var dateComps = DateComponents( year: 2019, month: 2, day: 15 )
let calendar = Calendar.current

now < calendar.date(from: dateComps)!


extension Array {
	func customFilter(_ operation: (Element) -> Bool) -> [Element] {
		var results: [Element] = []
		
		for element in self {
			if operation(element) {
				results.append(element)
			}
		}
		
		return results
	}
	
	func customGenericMap<U>(_ operation: (Element) -> U) -> [U] {
		var results: [U] = []
		for element in self {
			results.append(operation(element))
		}
		return results
	}
}

let intArray = Array(1...100)
let strArray = ["a", "b", "c"]
let resultIntArray = intArray.customFilter { $0 % 3 == 0 }
let resultStrArray = strArray.customFilter { $0 < "c" }

print(resultIntArray)
print(resultStrArray)


// MARK: - Map

func customMap(numbers: [Double], operation: (Double) -> Double) -> [Double] {
	var result: [Double] = []
	for number in numbers {
		let resultingValue = operation(number)
		result.append(resultingValue)
	}
	return result
}

let squaredInts = customMap(numbers: [2, 3, 9]) { (int) -> Double in
	int * int
}

print(squaredInts)

let squaredIntsGeneric = [2, 3, 9].customGenericMap { $0 * $0 }
print(squaredIntsGeneric)
