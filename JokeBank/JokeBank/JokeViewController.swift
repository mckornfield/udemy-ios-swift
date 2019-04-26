//
//  JokeViewController.swift
//  JokeBank
//
//  Created by Matthew Kornfield on 4/26/19.
//  Copyright © 2019 Matthew Kornfield. All rights reserved.
//

import UIKit

class JokeViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerLabel: UILabel!
    var joke = ""
    var question = ""
    var answer = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("View did load")
        title = joke
        questionLabel.text = "Q: \(question)"
        answerLabel.text =  "A: \(answer)" 
    }
}
