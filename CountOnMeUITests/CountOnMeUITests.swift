//
//  CountOnMeUITests.swift
//  CountOnMeUITests
//
//  Created by David DUBEZ on 14/12/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import XCTest

class CountOnMeUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test.
		// Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation
		// - required for your tests before they run.
		// The setUp method is a good place to do this.

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testResultWithPlusCalculation() {

		let app = XCUIApplication()

		app.buttons["1"].tap()
		app.buttons["8"].tap()
		app.buttons["+"].tap()
		app.buttons["8"].tap()
		app.buttons["5"].tap()
		app.buttons["="].tap()

		XCTAssertEqual(app.textViews["resultScreen"].value as? String, "18+85=103")
	}

	func testResultWithMinusCalculation() {

		let app = XCUIApplication()

		app.buttons["2"].tap()
		app.buttons["8"].tap()
		app.buttons["⌫"].tap()
		app.buttons["2"].tap()
		app.buttons["-"].tap()
		app.buttons["1"].tap()
		app.buttons["2"].tap()
		app.buttons["="].tap()

		XCTAssertEqual(app.textViews["resultScreen"].value as? String, "22-12=10")
	}

	func testDisplayAlertForWrongExpressionWithMinus() {
		let app = XCUIApplication()

		app.buttons["4"].tap()
		app.buttons["-"].tap()
		app.buttons["-"].tap()

		XCTAssertTrue(app.alerts["Zéro!"].exists)
		XCTAssert(app.alerts.element.staticTexts["Expression incorrecte !"].exists)
	}

	func testDisplayAlertForWrongExpressionWithPlus() {
		let app = XCUIApplication()

		app.buttons["6"].tap()
		app.buttons["+"].tap()
		app.buttons["+"].tap()

		XCTAssertTrue(app.alerts["Zéro!"].exists)
		XCTAssert(app.alerts.element.staticTexts["Expression incorrecte !"].exists)
	}

	func testDisplayAlertForStartANewCalculation() {
		let app = XCUIApplication()

		app.buttons["6"].tap()
		app.buttons["+"].tap()
		app.buttons["4"].tap()
		app.buttons["="].tap()
		app.buttons["="].tap()

		XCTAssertTrue(app.alerts["Zéro!"].exists)
		XCTAssert(app.alerts.element.staticTexts["Démarrez un nouveau calcul !"].exists)
	}

	func testDisplayAlertForEgalAfterAnOperator() {
		let app = XCUIApplication()

		app.buttons["6"].tap()
		app.buttons["+"].tap()
		app.buttons["="].tap()

		XCTAssertTrue(app.alerts["Zéro!"].exists)
		XCTAssert(app.alerts.element.staticTexts["Entrez une expression correcte !"].exists)
	}

	func testDisplayAlertForOutOfRangeResult() {
		let app = XCUIApplication()

		app.buttons["9"].tap()
		for _ in 1...18 {
			app.buttons["2"].tap()
		}
		app.buttons["+"].tap()
		app.buttons["9"].tap()
		for _ in 1...18 {
			app.buttons["2"].tap()
		}
		app.buttons["="].tap()

		XCTAssertTrue(app.alerts["Zéro!"].exists)
		XCTAssert(app.alerts.element.staticTexts["Le resultat est hors limite !"].exists)
	}
}
