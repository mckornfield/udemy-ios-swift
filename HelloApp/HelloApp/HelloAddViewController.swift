//
//  HelloAddViewController.swift
//  HelloApp
//
//  Created by Matthew Kornfield on 4/29/19.
//  Copyright © 2019 Matthew Kornfield. All rights reserved.
//

import UIKit

class HelloAddViewController: UIViewController {

    @IBOutlet weak var messageField: UITextField!
    var updateFunc : () -> Void = {}
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addMessage(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let data = HelloData(context: context)
            data.value = messageField.text
            updateFunc()
            navigationController?.popViewController(animated: true)
        }
    }
}
