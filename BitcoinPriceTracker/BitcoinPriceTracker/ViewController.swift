//
//  ViewController.swift
//  BitcoinPriceTracker
//
//  Created by Matthew Kornfield on 5/1/19.
//  Copyright © 2019 Matthew Kornfield. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getPrice()
    }

    func getPrice() {
        if let url = URL(string :"http://localhost:8081") {
            URLSession.shared.dataTask(with: url, completionHandler: {(data,response,error)in
                if let data = data {
                    print("It worked!")
                } else {
                    print("It broke!")
                    print(error)
                }
            }).resume()
        }
    }

}

