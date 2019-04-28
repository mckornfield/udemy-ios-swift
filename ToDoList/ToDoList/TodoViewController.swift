//
//  ViewController.swift
//  ToDoList
//
//  Created by Matthew Kornfield on 4/28/19.
//  Copyright © 2019 Matthew Kornfield. All rights reserved.
//

import UIKit

class TodoViewController: UIViewController {

    @IBOutlet weak var todoText: UILabel!
    var todo : Todo? = nil

    var removeTodo : () -> Void = {}

    override func viewDidLoad() {
        super.viewDidLoad()
        if let td :Todo = todo {
            todoText.text = td.toString()
        }
        
    }
    

    @IBAction func completeTodo(_ sender: Any) {
        removeTodo()
        navigationController?.popViewController(animated: true)
    }
    

}

