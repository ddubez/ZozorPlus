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
			if calculation.addNewNumber(numberButton.titleLabel!.text!) {
				updateDisplay()
            } else {
				displayAlert(message: "Le nombre est trop grand")
			}
		}
    }

    @IBAction func plus() {
		// add operator for addition
		addAn(operatorTapped: "+")
    }

    @IBAction func minus() {
		// add operator for substraction
		addAn(operatorTapped: "-")
    }

    @IBAction func equal() {
		// calculate the result
		if calculation.calculateTotal() {
			textView.text += "=\(calculation.total)"
			scrollText()
			calculation.clear()
		} else {
			switch calculation.canAddOperator {
			case false where calculation.stringNumbers.count == 1:
				displayAlert(message: "Démarrez un nouveau calcul !")
			case true:
				displayAlert(message: "Le resultat est hors limite !")
			default:
				displayAlert(message: "Entrez une expression correcte !")
			}
		}
    }

	// MARK: - BONUS
	@IBAction func deleteLast(sender: UIButton) {
		// delete the last number or operator
		calculation.deleteLastImput()
		updateDisplay()
	}

    // MARK: - Method

    private func updateDisplay() {
		// update the textView
		textView.text = calculation.text
		scrollText()
    }

	private func displayAlert(message: String) {
		// Display an alertController with a message if add an operator or egal at the wrong place
		let alertVC = UIAlertController(title: "Zéro!", message: "\(message)", preferredStyle: .alert)
		alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
		self.present(alertVC, animated: true, completion: nil)
	}

	private func addAn(operatorTapped: String) {
		// add operator
		if calculation.addOperator(operatorTapped) {
			updateDisplay()
		} else {
			displayAlert(message: "Expression incorrecte !")
		}
	}

	private func scrollText() {
		// Automatically scroll textView when adding text at the bottom of UITextView
		let textViewRange = NSRangeFromString(textView.text)
		textView.scrollRangeToVisible(textViewRange)
	}
}
