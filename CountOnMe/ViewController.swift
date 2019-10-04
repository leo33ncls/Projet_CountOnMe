//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!

    var calcul = SimpleCalc()

    var elements: [String] {
        return textView.text.split(separator: " ").map { "\($0)" }
    }

    var expressionHaveResult: Bool {
        return textView.text.firstIndex(of: "=") != nil
    }

    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }

        if expressionHaveResult {
            textView.text = ""
        }

        if calcul.lastElementIsDivision(elements: elements) && numberText == "0" {
            let alertVC = UIAlertController(title: "Attention!", message: "Division par zéro impossible !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        } else {
            textView.text.append(numberText)
        }
    }

    @IBAction func tappedOperatorButton(_ sender: UIButton) {
        guard !expressionHaveResult else { return }

        if calcul.canAddOperator(elements: elements) {
            switch sender.tag {
            case 1: textView.text.append(" + ")
            case 2: textView.text.append(" - ")
            case 3: textView.text.append(" x ")
            case 4: textView.text.append(" ÷ ")
            default: return
            }
        } else {
            let alertVC = UIAlertController(title: "Attention!", message: "Un operateur est déja mis !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        }
    }

    @IBAction func tappedEqualButton(_ sender: UIButton) {
        guard calcul.expressionIsCorrect(elements: elements) else {
            let alertVC = UIAlertController(title: "Attention!", message: "Entrez une expression correcte !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
        }

        guard calcul.expressionHaveEnoughElement(elements: elements) else {
            let alertVC = UIAlertController(title: "Attention!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
        }

        let result = calcul.calcul(operations: elements)

        if let calculResult = result {
            textView.text.append(" = \(calculResult)")
        }
    }

}
