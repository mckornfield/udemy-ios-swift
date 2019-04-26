//
//  ViewController.swift
//  SwiftFun
//
//  Created by Matthew Kornfield on 4/19/19.
//  Copyright © 2019 Matthew Kornfield. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myFirstLabel: UILabel!

    @IBOutlet weak var totalTextField: UITextField!

    @IBOutlet weak var tipTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    var count = 0
    @IBAction func buttonTapped(_ sender: Any) {
//        print("I clicked the button")
//
//        count += 1
//        myFirstLabel.text = "OMG you changed the button " + String(count) + " times"
//        if count == 10 {
//            view.backgroundColor = UIColor.green
//        }
        
        let total = Double(totalTextField.text!)!
        print(total)
    
        let tipPercentage = Double(tipTextField.text!)!
        print(tipPercentage)
        
        let tip : Double = total * (tipPercentage/100)
        
        let newTotal = total + tip
        
        let tipFormatted = String(format: "%.2f", tip) + (tip > 50.0 ? "🚀" : "")
        let newTotalFormatted = String(format: "%.2f", newTotal)
        myFirstLabel.text = "Tip : $\(tipFormatted), New Total: $\(newTotalFormatted)"
        
    }

}

