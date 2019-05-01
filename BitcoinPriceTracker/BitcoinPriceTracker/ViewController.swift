//
//  ViewController.swift
//  BitcoinPriceTracker
//
//  Created by Matthew Kornfield on 5/1/19.
//  Copyright © 2019 Matthew Kornfield. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var japanLabel: UILabel!
    @IBOutlet weak var euroLabel: UILabel!
    @IBOutlet weak var lastUpdatedLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getPrice()
    }

    @IBAction func updatePrice(_ sender: Any) {
        getPrice()
    }


    func getPrice() {
        if let url = URL(string :"http://localhost:8081") {
            URLSession.shared.dataTask(with: url, completionHandler: {(data,response,error)in
                if let data = data {
                    print("It worked!")
                    if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Double] {
                        DispatchQueue.main.async {
                            if let usd = json["USD"]{
                                self.usdLabel.text = "$\(usd)"
                            }
                            if let yen = json["JPY"]{
                                self.japanLabel.text = "¥\(yen)"
                            }
                            if let eur = json["EUR"]{
                                self.euroLabel.text = "€\(eur)"

                            }
                            let formatter = DateFormatter()
                            formatter.dateFormat = "yyyy/MM/dd HH:mm"
                            self.lastUpdatedLabel.text = "Last Updated: " + formatter.string(from: Date.init())
                        }
                    }
                } else {
                    print("It broke!")
                    print(error)
                }
            }).resume()
        }
    }

}

