//
//  ViewController.swift
//  CountOnMe
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
	var calculation = Calculation()

    // MARK: - Outlets
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!

    // MARK: - Action
    @IBAction func tappedNumberButton(_ sender: UIButton) {
		// add the button corresponding number
		for numberButton in numberButtons where sender == numberButton {
			calculation.addNewNumber(numberButton.titleLabel!.text!)
			updateDisplay()
            }
    }

    @IBAction func plus() {
		// add operator for addition
        if calculation.isExpressionCorrect {
        	calculation.addOperation("+")
            updateDisplay()
		} else {
			alertWrongOperator()
		}
    }

    @IBAction func minus() {
		// add operator for substraction
        if calculation.isExpressionCorrect {
            calculation.addOperation("-")
            updateDisplay()
        } else {
			alertWrongOperator()
		}
    }

    @IBAction func equal() {
		// calculate the result
		if calculation.isExpressionCorrect {
			calculation.calculateTotal()
			textView.text += "=\(calculation.total)"
			calculation.clear()
		} else {
			alertWrongEgal()
		}
    }

    // MARK: - Method

    private func updateDisplay() {
		// update the textView
		textView.text = calculation.text
    }

	private func alertWrongOperator() {
		// Display an alertController if add an operator at the wrong place
		let alertVC = UIAlertController(title: "Zéro!", message: "Expression incorrecte !", preferredStyle: .alert)
		alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
		self.present(alertVC, animated: true, completion: nil)
	}

	private func alertWrongEgal() {
		// Display an alertController if calculate the result of a bad expression
		if calculation.stringNumbers.count == 1 {
			let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
			alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
			self.present(alertVC, animated: true, completion: nil)
		} else {
			let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
			alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
			self.present(alertVC, animated: true, completion: nil)
			}
	}
}
