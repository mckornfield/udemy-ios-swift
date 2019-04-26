//
//  JokeTableViewController.swift
//  JokeBank
//
//  Created by Matthew Kornfield on 4/26/19.
//  Copyright © 2019 Matthew Kornfield. All rights reserved.
//

import UIKit

class JokeTableViewController: UITableViewController {

    var jokes = ["Six and Seven", "Circus Fire", "A Man Walks Into a Bar"]

    var questions = ["Why was six afraid of seven?", "Did you hear the one about the circus fire?", "A Man Walks Into a Bar"]
    var answers = ["Because seven eight nine.", "It was in tents.", "Ow"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return jokes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = jokes[indexPath.row]

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "moveToJokeDefinition", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Hey!")
        if let jokeVC = segue.destination as? JokeViewController {
            if let location = sender as? Int {
                jokeVC.joke = jokes[location]
                jokeVC.question = questions[location]
                jokeVC.answer = answers[location]
            }
        }
    }


}
