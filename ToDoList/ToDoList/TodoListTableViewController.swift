//
//  TodoListTableViewController.swift
//  ToDoList
//
//  Created by Matthew Kornfield on 4/28/19.
//  Copyright © 2019 Matthew Kornfield. All rights reserved.
//

import UIKit

class TodoListTableViewController: UITableViewController {

    var todos: [Todo] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        todos = [
            Todo(important:true,name:"Take out the trash"),
            Todo(important:false,name:"Pay Taxes"),
            Todo(important:true,name:"Watch church"),
        ]
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let todo = todos[indexPath.row]
        cell.textLabel?.text = todo.toString()

        // Configure the cell...

        return cell
    }
 
}
