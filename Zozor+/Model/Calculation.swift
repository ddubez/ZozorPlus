//
//  Calculation.swift
//  CountOnMe
//
//  Created by David DUBEZ on 08/12/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import Foundation

class Calculation {
	// creation of a calculation class

	// MARK: - PROPERTIES
	// array for store numbers
	var stringNumbers: [String] = [String()]

	// array for store operators
	var operators: [String] = ["+"]

	// total of calculation
	var total: Int = 0

	// text of calculation
	var text: String {
		var text = ""
		for (counter, stringNumber) in stringNumbers.enumerated() {
			// Add operator
			if counter > 0 {
				text += operators[counter]
			}
			// Add number
			text += stringNumber
		}
		return text
	}

	// verify if expression is correct before calculate a total or adding a operator
	var canAddOperator: Bool {
		if let stringNumber = stringNumbers.last {
			if stringNumber.isEmpty {
				return false
			}
		}
		return true
	}

	// MARK: - METHODS

	// add a number
	@discardableResult
	func addNewNumber(_ newNumber: String) -> Bool {
		if let stringNumber = stringNumbers.last {
			var stringNumberMutable = stringNumber
			stringNumberMutable += "\(newNumber)"
			if Int(stringNumberMutable) == nil {
				// Verify if number is not out of range
				return false
			}
			stringNumbers[stringNumbers.count-1] = stringNumberMutable
		}
		return true
	}

	// add an operator in a calculation
	func addOperator(_ operatorToAdd: String) -> Bool {
		if canAddOperator {
			operators.append(operatorToAdd)
			stringNumbers.append("")
			return true
		}
		return false
	}

	// calculate the total
	func calculateTotal() -> Bool {
		if canAddOperator {
			for (counter, stringNumber) in stringNumbers.enumerated() {
				if let number = Int(stringNumber) {
					if operators[counter] == "+" {
						if Int.max - number >= total {
							// Verify if result is not out of range
							total += number
							} else {
							total = 0
							return false
						}
					} else if operators[counter] == "-" {
						if Int.min + number <= total {
							// Verify if result is not out of range
							total -= number
						} else {
							total = 0
							return false
						}
					}
				}
			}
		return true
		}
		return false
	}

	// clear the calculation
	func clear() {
		stringNumbers = [String()]
		operators = ["+"]
		total = 0
	}

	// BONUS :
	func deleteLastImput() {
		// delete the last number or operator
		if canAddOperator {
			if let lastNumber = stringNumbers.last {
				var lastNumberMutable = lastNumber
				lastNumberMutable.removeLast(1)
				stringNumbers[stringNumbers.count-1] = lastNumberMutable
			}
		} else if stringNumbers.count != 1 {
			stringNumbers.removeLast(1)
			operators.removeLast(1)
		}
	}
}
