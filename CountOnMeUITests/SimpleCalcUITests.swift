//
//  SimpleCalcUITests.swift
//  SimpleCalcUITests
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class SimpleCalcUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false

        app = XCUIApplication()
        app.launch()
    }

    func testGivenTextViewIsEmpty_ThenButton2IsPressed_ShouldTestViewDisplay2(){

        let app = XCUIApplication()
        app.buttons["4"].tap()
        app.buttons["5"].tap()

        let textView = app.textViews["textView"]

        XCTAssertEqual(textView.value as? String, "45")
    }
}
