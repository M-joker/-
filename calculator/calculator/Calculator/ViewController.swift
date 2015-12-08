//
//  ViewController.swift
//  Calculator
//
//  Created by 章敏杰 on 15/12/8.
//  Copyright © 2015年 zmj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypingANmuber = false

    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingANmuber {
            display.text = display.text! + digit
        }else {
            display.text = digit
            userIsInTheMiddleOfTypingANmuber = true
        }

    }
   
}

