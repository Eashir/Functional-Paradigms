import UIKit


// MARK: - Filter

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
//
//let birthdayComponents = DateComponents(month: 4, day: 20)
//let nextDate = Calendar.current.nextDate(after: Date(), matching: birthdayComponents, matchingPolicy: .nextTime)
//let nextDateComps = Calendar.current.dateComponents([.year, .month, .day, .hour], from: nextDate!)
////Calendar.current.dateComponents([.year, .month, .day, .hour], from: nextDate)
////let calendar = Calendar.current
//let dateFromComps = calendar.date(from: nextDateComps)
//print(dateFromComps)


extension Date {
	
	func formatForFlyerDetail() -> String {
		let formatter = DateFormatter()
		formatter.dateFormat = "EEEE, MMMM d"
		return formatter.string(from: self)
	}
	
}

let iso = "2019-05-22T12:29:00-04:00"
let formatter = DateFormatter()
formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
formatter.locale = Locale(identifier: "en_US")
formatter.date(from: iso)!
if let validDate = formatter.date(from: iso) {
	print(validDate.formatForFlyerDetail())
}

//print(iso.formatForFlyerDetail())


struct Contact {
	var firstName: String
	var lastName: String
}

var contacts = [
	Contact(firstName: "Kenny", lastName: "Ackerman"),
	Contact(firstName: "Levi", lastName: "Ackerman"),
	Contact(firstName: "Rod", lastName: "Reiss"),
	Contact(firstName: "Armin", lastName: "Arlert"),
	Contact(firstName: "Mikasa", lastName: "Ackerman"),
	Contact(firstName: "Eren", lastName: "Jaegar"),
]


extension Array {
	func singleCharNameFilter(_ operation: (Element) -> Bool) -> [Element] {
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

//Single char
let firstNameArr = contacts.singleCharNameFilter { String(Array($0.firstName)[0]) == "A" }
var lastFirstNames = contacts.filter { String(Array($0.firstName)[0]) == "A" || String(Array($0.lastName)[0]) == "A" }

//prone to duplicates

lastFirstNames.sort{ $0.firstName < $1.firstName }

for contact in lastFirstNames {
	print(contact)
}

var numArr = Array(0...30)

numArr.sort{ $0 > $1}
print(numArr)

//Get all first names
//Get all last names
//Add both arrays

//Could make a set of each array and union them to remove duplicates



//Take substring
//Check if substring is valid in first or last name
//Alphabetize


var searchText = "Lffylu"

func findSubString(_ str: String, searchText: String) -> Bool {
	var searchTextt = searchText.lowercased()
	if searchTextt.contains(str.lowercased()) {
		return true
	}
	return false
}

findSubString("Lu", searchText: searchText)



