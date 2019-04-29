//
//  TodoListTableViewController.swift
//  ToDoList
//
//  Created by Matthew Kornfield on 4/28/19.
//  Copyright © 2019 Matthew Kornfield. All rights reserved.
//

import UIKit

class TodoListTableViewController: UITableViewController {
    
    var todos: [ToDoStore] = []
    
    override func viewWillAppear(_ animated: Bool) {
        getTodos()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todos.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let todo = todos[indexPath.row]
        cell.textLabel?.text = toString(todo: todo)
        
        // Configure the cell...
        
        return cell
    }
    
    
    func toString(todo: ToDoStore) -> String {
        if let name = todo.name{
            return "\(todo.important ? "! " : "")\(name)"
        } else {
            return ""
        }
    }
    
    func getTodos() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let todosFromCoreData = try? context.fetch(ToDoStore.fetchRequest()){
                if let todos = todosFromCoreData as? [ToDoStore]{
                    self.todos = todos
                    tableView.reloadData()
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ClickIndividualTodo", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let createVC = segue.destination as? CreateTodoViewController {
            createVC.todoTableVC = self
        } else if let completeVC = segue.destination as? TodoViewController {
            if let todoIndex = sender as? Int {
                completeVC.todo = todos[todoIndex]
                completeVC.removeTodo = {
                    if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                        context.delete(completeVC.todo!)
                        try? context.save()
                        self.tableView.reloadData()
                    }

                }
            }
        }
    }
}
