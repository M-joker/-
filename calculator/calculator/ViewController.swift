//
//  ViewController.swift
//  calculator
//
//  Created by 章敏杰 on 15/11/22.
//  Copyright (c) 2015年 zmj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var userlslnTheMiddleOfTypingANumber: Bool = false

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
        let opration = sender.currentTitle!
        if userlslnTheMiddleOfTypingANumber {
            enter()
        }
        switch opration{
            case "✖️"：
            if operandStack.count >= 2 {
               dispalyvalue = operandStack.removeLast() * operandStack.removeLast()
                enter()
//            case "➗"：
//            case "➕"：
//            case "➖"：
            default: break
        }
    }
    
    var operandStack:Array<Double> = Array<Double>()
    @IBAction func enter() {
        userlslnTheMiddleOfTypingANumber = false
        operandStack.append(displayvalue)
        println("operands = \(operandStack)")
    }
    var displayvalue:Double{
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
          display.text = "\(newValue)"
            userlslnTheMiddleOfTypingANumber = false
        }
    }
}

