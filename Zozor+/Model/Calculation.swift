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
	var total = 0

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
	var isExpressionCorrect: Bool {
		if let stringNumber = stringNumbers.last {
			if stringNumber.isEmpty {
				return false
			}
		}
		return true
	}

	// MARK: - METHODS

	// add a number
	func addNewNumber(_ newNumber: String) {
		if let stringNumber = stringNumbers.last {
			var stringNumberMutable = stringNumber
			stringNumberMutable += "\(newNumber)"
			stringNumbers[stringNumbers.count-1] = stringNumberMutable
		}
	}

	// add an operator in a calculation
	func addOperation(_ operatorToAdd: String) {
		operators.append(operatorToAdd)
		stringNumbers.append("")
	}

	// calculate the total
	func calculateTotal() {
		for (counter, stringNumber) in stringNumbers.enumerated() {
			if let number = Int(stringNumber) {
				if operators[counter] == "+" {
					total += number
				} else if operators[counter] == "-" {
					total -= number
				}
			}
		}
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
		if isExpressionCorrect {
			if let lastNumber = stringNumbers.last {
				var lastNumberMutable = lastNumber
				lastNumberMutable.removeLast(1)
				stringNumbers[stringNumbers.count-1] = lastNumberMutable
			}
		} else {
			stringNumbers.removeLast(1)
			operators.removeLast(1)
		}
	}
}
