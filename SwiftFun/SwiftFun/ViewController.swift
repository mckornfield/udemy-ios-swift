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

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    var count = 0
    @IBAction func buttonTapped(_ sender: Any) {
        print("I clicked the button")
        
        count += 1
        myFirstLabel.text = "OMG you changed the button " + String(count) + " times"
        if count == 10 {
            view.backgroundColor = UIColor.green
        }
        
    }
    
}

