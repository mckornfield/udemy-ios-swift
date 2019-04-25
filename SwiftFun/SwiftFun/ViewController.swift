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
        view.backgroundColor = UIColor.green

        myFirstLabel.text = "HEYYYYYYYYYY what's going on!"
    }


}

