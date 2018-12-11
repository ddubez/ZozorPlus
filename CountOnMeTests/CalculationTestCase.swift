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

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	func testGivenStringNumbersIsEmty_WhenAddingNumberTwo_ThenStringNumberSouldBeTwo() {
		let calculation = Calculation()
		calculation.addNewNumber("2")

		XCTAssertEqual(calculation.stringNumbers[0], "2")
	}

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
