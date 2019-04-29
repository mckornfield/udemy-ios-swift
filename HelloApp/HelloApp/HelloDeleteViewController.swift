//
//  HelloDeleteViewController.swift
//  HelloApp
//
//  Created by Matthew Kornfield on 4/29/19.
//  Copyright © 2019 Matthew Kornfield. All rights reserved.
//

import UIKit

class HelloDeleteViewController: UIViewController {

    var deleteFunc : () -> Void = {}

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func removeHello(_ sender: Any) {
        deleteFunc()
        navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
