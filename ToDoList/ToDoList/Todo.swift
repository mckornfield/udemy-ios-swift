//
//  TodoClass.swift
//  ToDoList
//
//  Created by Matthew Kornfield on 4/28/19.
//  Copyright © 2019 Matthew Kornfield. All rights reserved.
//

import Foundation

class Todo {
    
    var important = false
    var name = ""
    
    init(important: Bool, name: String) {
        self.important = important
        self.name = name
    }
    
    func toString() -> String {
        return "\(important ? "! " : "")\(name)"
    }
}
