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
    var todo : ToDoStore? = nil

    var removeTodo : () -> Void = {}

    override func viewDidLoad() {
        super.viewDidLoad()
        if let td :ToDoStore = todo {
            todoText.text = toString(todo: td)
        }
        
    }
    
    func toString(todo: ToDoStore) -> String {
        if let name = todo.name{
            return "\(todo.important ? "! " : "")\(name)"
        } else {
            return ""
        }
    }
    

    @IBAction func completeTodo(_ sender: Any) {
        removeTodo()
        navigationController?.popViewController(animated: true)
    }
    

}

