//
//  HelloTableViewController.swift
//  HelloApp
//
//  Created by Matthew Kornfield on 4/29/19.
//  Copyright © 2019 Matthew Kornfield. All rights reserved.
//

import UIKit

class HelloTableViewController: UITableViewController {

    var helloData : [HelloData] = []

    override func viewWillAppear(_ animated: Bool) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let helloDataFromCoreData = try? context.fetch(HelloData.fetchRequest()){
                print(helloDataFromCoreData)
                if let helloData2 = helloDataFromCoreData as? [HelloData] {
                    helloData = helloData2
                    self.tableView.reloadData()
                }
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return helloData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()


        cell.textLabel?.text = helloData[indexPath.row].value

        return cell
    }

    @IBAction func addHello(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let helloData = HelloData(context: context)
            helloData.value = "HELLO!"
            try? context.save()
            viewWillAppear(true)
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let dataToDelete = helloData[indexPath.row]
            context.delete(dataToDelete)
            try? context.save()
            viewWillAppear(true)
        }
    }

}
