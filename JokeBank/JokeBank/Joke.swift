//
//  Joke.swift
//  JokeBank
//
//  Created by Matthew Kornfield on 4/27/19.
//  Copyright © 2019 Matthew Kornfield. All rights reserved.
//

import UIKit

class Joke {
    let title : String
    let question :String
    let answer :String
    init(title:String, question:String, answer:String) {
        self.title = title
        self.question = question
        self.answer = answer
    }
}
