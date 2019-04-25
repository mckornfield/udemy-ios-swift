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

    @IBAction func buttonTapped(_ sender: Any) {
        print("I clicked the button")
        view.backgroundColor = UIColor.green

        myFirstLabel.text = "OMG you changed the button"
    }
    
}

