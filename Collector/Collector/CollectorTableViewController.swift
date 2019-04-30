//
//  CollectorTableViewController.swift
//  Collector
//
//  Created by Matthew Kornfield on 4/30/19.
//  Copyright © 2019 Matthew Kornfield. All rights reserved.
//

import UIKit

class CollectorTableViewController: UITableViewController {

    var collectables : [Collectable] = []
    override func viewDidAppear(_ animated: Bool) {
        updateCollectables()
    }

    func updateCollectables() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let collectablesFromCoreData = try? context.fetch(Collectable.fetchRequest()) {
                if let newCollectables = collectablesFromCoreData as? [Collectable]{
                    collectables = newCollectables
                    tableView.reloadData()
                }
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows

        print("inside tableview count")
        print(collectables)
        return collectables.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell() //  NEVER FORGET THIS
        print("inside row count")
        print(collectables)
        let collectable = collectables[indexPath.row]
        cell.textLabel?.text = collectable.title
        if let data = collectable.image {
            let image = UIImage(data: data)
            cell.imageView?.image = image
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let collectable = collectables[indexPath.row]
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                context.delete(collectable)
                try? context.save()
                tableView.reloadData()
            }
        }
    }
}
