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

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTodo(_ sender: Any) {
        if let name = todoName.text{
            let newTodo = Todo(important: importantSwitch.isOn, name: name)
            if todoTableVC != nil {
                todoTableVC!.todos.append(newTodo)
                todoTableVC!.tableView.reloadData()
                navigationController?.popViewController(animated: true)
            }
        }
    }

}
