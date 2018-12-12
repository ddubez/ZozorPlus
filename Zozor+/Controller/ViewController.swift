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
			displayAlert(message: "Expression incorrecte !")
		}
    }

    @IBAction func minus() {
		// add operator for substraction
        if calculation.isExpressionCorrect {
            calculation.addOperation("-")
            updateDisplay()
        } else {
			displayAlert(message: "Expression incorrecte !")
		}
    }

    @IBAction func equal() {
		// calculate the result
		if calculation.isExpressionCorrect {
			calculation.calculateTotal()
			textView.text += "=\(calculation.total)"
			calculation.clear()
		} else {
			if calculation.stringNumbers.count == 1 {
				displayAlert(message: "Démarrez un nouveau calcul !")
			} else {
				displayAlert(message: "Entrez une expression correcte !")
			}
		}
    }

    // MARK: - Method

    private func updateDisplay() {
		// update the textView
		textView.text = calculation.text
    }

	private func displayAlert(message: String) {
		// Display an alertController with a message if add an operator or egal at the wrong place
		let alertVC = UIAlertController(title: "Zéro!", message: "\(message)", preferredStyle: .alert)
		alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
		self.present(alertVC, animated: true, completion: nil)
	}
}
