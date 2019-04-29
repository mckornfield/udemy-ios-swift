//
//  TodoViewController.swift
//  ToDoList
//
//  Created by Matthew Kornfield on 4/28/19.
//  Copyright © 2019 Matthew Kornfield. All rights reserved.
//

import UIKit

class CreateTodoViewController: UIViewController {
    
    @IBOutlet weak var todoName: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    var todoTableVC: TodoListTableViewController? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addTodo(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let name = todoName.text{
                let newTodo = ToDoStore(context: context)
                newTodo.important = importantSwitch.isOn
                newTodo.name = name
                try? context.save()
                if todoTableVC != nil {
                    navigationController?.popViewController(animated: true)
                }
            }
        }
    }
    
}
