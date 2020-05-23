//
//  ViewController.swift
//  GuessTheNumber
//
//  Created by Maksym on 23/05/2020.
//  Copyright © 2020 mayicodefuture. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var guessButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    var attempts = 0
    var isGameOver = false
    var guessedNumber = Int.random(in: 1 ... 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func setGameOver(isGameOver: Bool) {
        if isGameOver == true {
            self.isGameOver = true
            guessButton.setTitle("Start again", for: .normal)
        } else {
            self.isGameOver = false
            guessButton.setTitle("Guess", for: .normal)
            attempts = 0
            guessedNumber = Int.random(in: 1 ... 10)
        }
    }
    
    
    @IBAction func handleGuess(_ sender: UIButton) {
        errorLabel.text = ""
        if isGameOver == true {
            setGameOver(isGameOver: false)
            errorLabel.textColor = UIColor.red
        } else {
            if let fieldNumber = Int(numberField.text!) {
                if 1...10 ~= fieldNumber {
                    if fieldNumber == guessedNumber {
                        setGameOver(isGameOver: true)
                        errorLabel.textColor = UIColor.link
                        errorLabel.text = "You win, guessed number was \(guessedNumber), start again?"
                    } else {
                        attempts += 1
                        errorLabel.text = "Try to guess again"
                    }
                } else {
                    errorLabel.text = "You must enter number in range 1 to 10"
                }
            }
            
            if attempts >= 3 {
                setGameOver(isGameOver: true)
                errorLabel.text = "Game over, guessed number was \(guessedNumber), start again?"
            }
        }
    }
}

