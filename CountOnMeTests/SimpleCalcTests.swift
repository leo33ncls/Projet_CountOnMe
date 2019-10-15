//
//  SimpleCalcTests.swift
//  SimpleCalcTests
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class SimpleCalcTests: XCTestCase {
    let calcul = SimpleCalc()

    func testGivenElementsAreInOrderEightyEightPlusAndSix_WhenCalculIsCalled_ThenReturnShouldBeNinetyFour() {
        let elements = ["88", "+", "6"]

        let result = calcul.calcul(operations: elements)

        XCTAssertEqual(result, "94.0")
    }

    func testGivenElementsAreInOrderThirtySixLessAndNinetySeven_WhenCalculIsCalled_ThenReturnShouldBe3492() {
        let elements = ["36", "x", "97"]

        let result = calcul.calcul(operations: elements)

        XCTAssertEqual(result, "3492.0")
    }

    func testGivenElementsAreInOrder308PlusAnd773_WhenCalculIsCalled_ThenReturnShouldBeLess465() {
        let elements = ["308", "-", "773"]

        let result = calcul.calcul(operations: elements)

        XCTAssertEqual(result, "-465.0")
    }

    func testGivenElementsAreInOrderEightyDivAndSixtyThree_WhenCalculIsCalled_ThenReturnShouldBe1Dot269() {
        let elements = ["80", "÷", "63"]

        let result = calcul.calcul(operations: elements)

        XCTAssertEqual(result, "1.269")
    }

    func testGivenElementsAreInOrderPlusFiveAndSix_WhenCalculIsCalled_ThenReturnShouldBeNil() {
        let elements = [ "+", "5", "6"]

        let result = calcul.calcul(operations: elements)

        XCTAssertNil(result)
    }

    func testGivenElementsAreInOrderFortyNineteenAndLess_WhenCalculIsCalled_ThenReturnShouldBeNil() {
        let elements = [ "40", "19", "-"]

        let result = calcul.calcul(operations: elements)

        XCTAssertNil(result)
    }

    func testGivenElementsAreInOrderTwentySevenPlusFortyFiveAndLess_WhenCalculIsCalled_ThenReturnShouldBeNil() {
        let elements = [ "27", "+", "45", "-"]

        let result = calcul.calcul(operations: elements)

        XCTAssertNil(result)
    }

    func testGivenElementsAreInOrderLessEightLessAndNineteen_WhenCalculIsCalled_ThenReturnShouldBeNil() {
        let elements = [ "-", "8", "-", "19"]

        let result = calcul.calcul(operations: elements)

        XCTAssertNil(result)
    }

    func testGivenElementsLess8Less19Less_WhenCalculIsCalled_ThenReturnShouldBeNil() {
        let elements = [ "-", "8", "-", "19", "-"]

        let result = calcul.calcul(operations: elements)

        XCTAssertNil(result)
    }

    func testGivenElementsAre54LessLess62And5_WhenCalculIsCalled_ThenReturnShouldBeNil() {
        let elements = ["54", "-", "-", "62", "5"]

        let result = calcul.calcul(operations: elements)

        XCTAssertNil(result)
    }

    func testGivenElementsAreInOrder66Plus94Less50_WhenCalculIsCalled_ThenReturnShouldBe110 () {
        let elements = [ "66", "+", "94", "-", "50"]

        let result = calcul.calcul(operations: elements)

        XCTAssertEqual(result, "110.0")
    }

    func testGivenElementsAreInOrder51Less60Less35_WhenCalculIsCalled_ThenReturnShouldBeLess44 () {
        let elements = [ "51", "-", "60", "-", "35"]

        let result = calcul.calcul(operations: elements)

        XCTAssertEqual(result, "-44.0")
    }

    func testGivenElementsAreInOrder33Plus80Multi4Div66_WhenCalculIsCalled_ThenReturnShouldBe37Dot848484() {
        let elements = ["33", "+", "80", "x", "4", "÷", "66"]

        let result = calcul.calcul(operations: elements)

        XCTAssertEqual(result, "37.848")
    }

    func testGivenElementsAreInOrder76Multi10Less31Div46_WhenCalculIsCalled_ThenReturnShouldBe759Dot3261() {
        let elements = ["76", "x", "10", "-", "31", "÷", "46"]

        let result = calcul.calcul(operations: elements)

        XCTAssertEqual(result, "759.326")
    }

    func testGivenElementsAreInOrder74Multi68Div0_WhenCalculIsCalled_ThenReturnShouldBeNil() {
        let elements = ["74", "x", "68", "÷", "0"]

        let result = calcul.calcul(operations: elements)

        XCTAssertNil(result)
    }

    func testGivenElementsAreInOrder87Div35Plus37Plus52_WhenCalculIsCalled_ThenReturnShouldBe91Dot485714() {
        let elements = ["87", "÷", "35", "+", "37", "+", "52"]

        let result = calcul.calcul(operations: elements)

        XCTAssertEqual(result, "91.485")
    }

    func testGivenElementsAreInOrder64Less43Multi14Div5_WhenCalculIsCalled_ThenReturnShouldBeLess56Dot4() {
        let elements = ["64", "-", "43", "x", "14", "÷", "5"]

        let result = calcul.calcul(operations: elements)

        XCTAssertEqual(result, "-56.400")
    }

    func testGivenElementsAreInOrder916Plus728Multi96_WhenCalculIsCalled_ThenReturnShouldBe70804() {
        let elements = ["916", "+", "728", "x", "96"]

        let result = calcul.calcul(operations: elements)

        XCTAssertEqual(result, "70804.0")
    }

    func testGivenElementsAre271Plus583Less844Div31Multi817_WhenCalculIsCalled_ThenReturnShouldBeLess21389Dot4839() {
        let elements = ["271", "+", "583", "-", "844", "÷", "31", "x", "817"]

        let result = calcul.calcul(operations: elements)

        XCTAssertEqual(result, "-21389.483")
    }
}
