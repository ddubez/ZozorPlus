//
//  CalculationTestCase.swift
//  CountOnMeTests
//
//  Created by David DUBEZ on 10/12/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CalculationTestCase: XCTestCase {
	var calculation: Calculation!

    override func setUp() {
       super.setUp()
		calculation = Calculation()
    }

	func testGivenStringNumbersIsEmty_WhenAddingNumberTwo_ThenStringNumberShouldBeTwo() {

		calculation.addNewNumber("2")

		XCTAssertEqual(calculation.stringNumbers[0], "2")
	}

	func testGivenStringNumbersIsTree_WhenAddingNumberTwo_ThenStringNumberShouldBeThirtyTwo() {
		calculation.stringNumbers[0] = "3"

		calculation.addNewNumber("2")

		XCTAssertEqual(calculation.stringNumbers[0], "32")
	}

	func testGivenStringNumbersIsMaxInt_WhenAddingNumber_ThenAddNumberSouldBeFalse() {
		calculation.stringNumbers[0] = "9223372036854775808"

		let action = calculation.addNewNumber("2")

		XCTAssertFalse(action)
	}

	func testGivenStringNumbersIsTwentyTwo_WhenAddingPlus_ThenStringNumberShouldBeTwentyTwoAndOperatorSouldBePlus() {
		calculation.stringNumbers[0] = "22"

		let action = calculation.addOperator("+")

		XCTAssertTrue(action)
		XCTAssertEqual(calculation.stringNumbers[0], "22")
		XCTAssertEqual(calculation.operators[0], "+")
	}

	func testGivenStringNumbersIsTwentyTreeAndFiveOperatorIsPlus_WhenGettingText_ThenTextSouldBeTwentyTreePlusFive() {
		calculation.stringNumbers = ["23", "5"]
		calculation.operators = ["+", "+"]

		let action = calculation.calculateTotal()

		XCTAssertTrue(action)
		XCTAssertEqual(calculation.text, "23+5")
	}

	func testGivenStringNumbersIsTreeAndFiveOperatorIsPlus_WhenGettingExpresion_ThenExpressionIsCorrect() {
		calculation.stringNumbers = ["3", "5"]
		calculation.operators = ["+", "+"]

		XCTAssertTrue(calculation.canAddOperator)
	}

	func testGivenStringNumbersIsTreeOperatorIsPlus_WhenGAddingPlus_ThenExpressionIsNotCorrect() {
		calculation.stringNumbers = ["3", ""]
		calculation.operators = ["+", "+"]

		XCTAssertFalse(calculation.addOperator("+"))
	}

	func testGivenStringNumbersIsTwentyTreeAndFiveOperatorIsPlus_WhenGettingResult_ThenTotalSouldBeTwentyHeight() {
		calculation.stringNumbers = ["23", "5"]
		calculation.operators = ["+", "+"]

		let action = calculation.calculateTotal()

		XCTAssertTrue(action)
		XCTAssertEqual(calculation.total, 28)
	}

	func testGivenStringNumbersIsFortyOneAndTreeOperatorIsMinus_WhenGettingResult_ThenTotalSouldBeThirtyHeight() {
		calculation.stringNumbers = ["41", "3"]
		calculation.operators = ["+", "-"]

		let action = calculation.calculateTotal()

		XCTAssertTrue(action)
		XCTAssertEqual(calculation.total, 38)
	}

	func testGivenStringNumberIsFortyOneAndTreeOperatorIsMinus_WhenClear_ThenStringNumberSouldBeEmptyAndOperatorIsPlus() {
		calculation.stringNumbers = ["41", "3"]
		calculation.operators = ["+", "-"]

		calculation.clear()

		XCTAssertEqual(calculation.stringNumbers, [""])
		XCTAssertEqual(calculation.operators, ["+"])
	}

	func testGivenCalculationIsFortyOnePlusHeight_WhenDeleteLast_ThenCalculationSouldBeFortyOnePlus() {
		calculation.stringNumbers = ["41", "8"]
		calculation.operators = ["+", "+"]

		calculation.deleteLastImput()

		XCTAssertEqual(calculation.stringNumbers, ["41", ""])
		XCTAssertEqual(calculation.operators, ["+", "+"])
		XCTAssertEqual(calculation.text, "41+")
	}

	func testGivenCalculationIsFortyOnePlusHeightMinus_WhenDeleteLast_ThenCalculationSouldBeFortyOnePlusHeight() {
		calculation.stringNumbers = ["41", "8", ""]
		calculation.operators = ["+", "+", "-"]

		calculation.deleteLastImput()

		XCTAssertEqual(calculation.stringNumbers, ["41", "8"])
		XCTAssertEqual(calculation.operators, ["+", "+"])
		XCTAssertEqual(calculation.text, "41+8")
	}

	func testGivenStringNumbersIsMaxInt_WhenAddingTen_ThenCalculationSouldBeFalse() {
		calculation.stringNumbers = ["9223372036854775807", "10"]
		calculation.operators = ["+", "+"]

		XCTAssertFalse(calculation.calculateTotal())
	}

	func testGivenStringNumbersIsFortyOneOperatorIsMinus_WhenGettingResult_ThenCalculationSouldBeFalse() {
		calculation.stringNumbers = ["41", ""]
		calculation.operators = ["+", "-"]

		XCTAssertFalse(calculation.calculateTotal())
	}

	func testGivenStringNumbersIsMinInt_WhenSubstractTen_ThenCalculationSouldBeFalse() {
		calculation.stringNumbers = ["0", "9223372036854775807", "10"]
		calculation.operators = ["+", "-", "-"]

		XCTAssertFalse(calculation.calculateTotal())
	}
}
