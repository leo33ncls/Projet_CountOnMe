//
//  SimpleCalc.swift
//  CountOnMe
//
//  Created by Léo NICOLAS on 25/09/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import Foundation

class SimpleCalc {

    // Check if the elements' order are correct
    func expressionIsCorrect(elements: [String]) -> Bool {
        var isCorrect = true

        for index in 0...elements.count-1 {
            if index % 2 == 0 {
                if Double(elements[index]) == nil {
                    isCorrect = false
                }

            } else {
                if Double(elements[index]) != nil {
                    isCorrect = false
                }
            }
        }

        if !canAddOperator(elements: elements) {
            return false
        }
        return isCorrect
    }

    // Check if the expression have a correct number of elements
    func expressionHaveEnoughElement(elements: [String]) -> Bool {
        return elements.count >= 3 && elements.count % 2 != 0
    }

    // Check if we can add an operator
    func canAddOperator(elements: [String]) -> Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "÷"
    }

    // Check if the last operator is a division
    func lastElementIsDivision(elements: [String]) -> Bool {
        return elements.last == "÷"
    }

    // Check if the expression contains a division by zero
    func expressionContainsDivisionByZero (elements: [String]) -> Bool {
        if elements.contains("÷") && !lastElementIsDivision(elements: elements) {
            let indexDivision = elements.firstIndex(of: "÷")

            if elements[indexDivision!+1] == "0" {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }

    // Check if the expression can be calculated
    private func expressionCanBeCalculated(elements: [String]) -> Bool {
        guard expressionHaveEnoughElement(elements: elements) else { return false}
        guard !expressionContainsDivisionByZero(elements: elements) else { return false }
        guard expressionIsCorrect(elements: elements) else { return false }
        return true
    }

    // Fonction which makes the calcul
    func calcul (operations: [String]) -> String? {
        var operationsToReduce = operations
        var operand: String
        var result: Double?

        while expressionCanBeCalculated(elements: operationsToReduce) {

            if operationsToReduce.contains("x") || operationsToReduce.contains("÷") {

                let indexOperand = operationsToReduce.firstIndex(where: { (element) -> Bool in
                    if element == "x" || element == "÷" {
                        return true
                    } else {
                        return false
                    }
                })

                if let indexOpe = indexOperand {
                    operand = operationsToReduce[indexOpe]
                    if let firstNumber = Double(operationsToReduce[indexOpe - 1]), let secondNumber = Double(operationsToReduce[indexOpe + 1]) {

                        switch operand {
                        case "x": result = firstNumber * secondNumber
                        case "÷": result = firstNumber / secondNumber
                        default: result = nil
                        }
                    }

                    operationsToReduce.removeSubrange(indexOpe-1...indexOpe+1)
                    if let calculResult = result {
                        operationsToReduce.insert("\(calculResult)", at: indexOpe-1)
                    }
                }

            } else {

                operand = operationsToReduce[1]
                if let firstNumber = Double(operationsToReduce[0]), let secondNumber = Double(operationsToReduce[2]) {

                    switch operand {
                    case "+": result = firstNumber + secondNumber
                    case "-": result = firstNumber - secondNumber
                    default: result = nil
                    }
                }

                operationsToReduce = Array(operationsToReduce.dropFirst(3))
                if let calculResult = result {
                    operationsToReduce.insert("\(calculResult)", at: 0)
                }
            }
        }

        if let calculResult = operationsToReduce.first, operationsToReduce.count == 1 {
            return roundResult(result: calculResult)
        } else {
            return nil
        }
    }

    private func roundResult(result: String) -> String {
        var splitResult = result.split(separator: ".")
        if splitResult[1].count >= 5 {
            return splitResult[0] + "." + splitResult[1].dropLast(splitResult[1].count - 3)
        } else {
            return result
        }
    }
}
