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
        let operation = sender.currentTitle!
        if userlslnTheMiddleOfTypingANumber {
            enter()
        }
        switch operation {
        case "*": performOperation { $0 * $1 }
        case "/": performOperation { $0 / $1 }
        case "+": performOperation { $0 + $1 }
        case "-": performOperation { $0 - $1 }
        default: break
        }
    }
    
    func performOperation(operation: (Double,Double) ->Double) {
        if operandStack.count >= 2{
            displayValue = operandStack.removeLast() * operandStack.removeLast()
            enter()
        }

    }
    func multiply(op1: Double,op2: Double) ->Double {
        return op1 * op2
    }
    var operandStack = Array<Double>()

    @IBAction func enter() {
        userlslnTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        println(" operandStack = \( operandStack)")
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

}
