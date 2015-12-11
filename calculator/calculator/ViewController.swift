//
//  ViewController.swift
//  calculator
//
//  Created by 章敏杰 on 15/11/22.
//  Copyright (c) 2015年 zmj. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var display: UILabel!
    var userlslnTheMiddleOfTypingANumber = false
    var brain = CalcultorBrain()

    @IBAction func appendDigit(sender: UIButton) {
       let digit = sender.currentTitle!
        if userlslnTheMiddleOfTypingANumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userlslnTheMiddleOfTypingANumber = true
        
        }
       
    }
    @IBAction func operate(sender: UIButton) {
        if userlslnTheMiddleOfTypingANumber {
            enter()
        }
        if let operation = sender.currentAttributedTitle {
        }

        }
    }


    @IBAction func enter() {
        userlslnTheMiddleOfTypingANumber = false
        if let result = brain.pushOperand(displayValue) {
            displayValue = result
        }else {
            displayValue = 0
        }
}
    var displayValue:Double {
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            userlslnTheMiddleOfTypingANumber = false
        }
    }


