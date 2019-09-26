//
//  SimpleCalc.swift
//  CountOnMe
//
//  Created by Léo NICOLAS on 25/09/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import Foundation

class SimpleCalc {

    func calcul (operations: [String]) -> String? {

        var operationsToReduce = operations
        var operand: String
        var firstNumber: Double
        var secondNumber: Double
        var result: Double? = nil

        while operationsToReduce.count % 2 != 0 && operationsToReduce.count > 1 {

            if operationsToReduce.contains("x") || operationsToReduce.contains("÷") {
                var indexOperand = 1
                let indexMulti = operationsToReduce.firstIndex(of: "x")
                let indexDivision = operationsToReduce.firstIndex(of: "÷")

                if let indexMul = indexMulti, let indexDiv = indexDivision {
                    if indexMul < indexDiv {
                        indexOperand = indexMul
                        operand = operationsToReduce[indexMul]
                        firstNumber = Double(operationsToReduce[indexMul - 1])!
                        secondNumber = Double(operationsToReduce[indexMul + 1])!
                        result = firstNumber * secondNumber
                    } else {
                        indexOperand = indexDiv
                        operand = operationsToReduce[indexDiv]
                        firstNumber = Double(operationsToReduce[indexDiv - 1])!
                        secondNumber = Double(operationsToReduce[indexDiv + 1])!
                        result = firstNumber / secondNumber
                    }
                } else if let indexMul = indexMulti {
                    indexOperand = indexMul
                    operand = operationsToReduce[indexMul]
                    firstNumber = Double(operationsToReduce[indexMul - 1])!
                    secondNumber = Double(operationsToReduce[indexMul + 1])!
                    result = firstNumber * secondNumber
                } else {
                    if let indexDiv = indexDivision {
                        indexOperand = indexDiv
                        operand = operationsToReduce[indexDiv]
                        firstNumber = Double(operationsToReduce[indexDiv - 1])!
                        secondNumber = Double(operationsToReduce[indexDiv + 1])!
                        result = firstNumber / secondNumber
                    }
                }

                operationsToReduce.removeSubrange(indexOperand-1...indexOperand+1)
                if let calculResult = result {
                    operationsToReduce.insert("\(calculResult)", at: indexOperand-1)
                }

            } else {

                operand = operationsToReduce[1]
                if let left = Double(operationsToReduce[0]), let right = Double(operationsToReduce[2]) {

                    switch operand {
                    case "+": result = left + right
                    case "-": result = left - right
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
            if let floatResult = Float(calculResult) {
                let calResult = String(floatResult)
                return calResult
            } else {
                return calculResult
            }

        } else {
            return nil
        }
    }
}
