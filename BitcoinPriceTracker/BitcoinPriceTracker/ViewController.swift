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
        getDefaultPrices()
        getPrice()
    }

    @IBAction func updatePrice(_ sender: Any) {
        getPrice()
    }

    func getDefaultPrices(){
        let usdPrice = UserDefaults.standard.double(forKey: "usd")
        if usdPrice != 0.0 {
            self.usdLabel.text = self.doubleToMoney(usdPrice, "USD") + "~"
        }
        let jpyPrice = UserDefaults.standard.double(forKey: "jpy")
        if jpyPrice != 0.0 {
            self.japanLabel.text = self.doubleToMoney(jpyPrice, "JPY") + "~"
        }
        let eurPrice = UserDefaults.standard.double(forKey: "eur")
        if eurPrice != 0.0 {
            self.euroLabel.text = self.doubleToMoney(eurPrice, "EUR") + "~"
        }
    }


    func getPrice() {
        if let url = URL(string :"http://localhost:8081") {
            URLSession.shared.dataTask(with: url, completionHandler: {(data,response,error)in
                if let data = data {
                    print("It worked!")
                    if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Double] {
                        DispatchQueue.main.async {
                            if let usd = json["USD"]{
                                self.usdLabel.text = self.doubleToMoney(usd, "USD")
                                UserDefaults.standard.set(usd, forKey: "usd")
                            }
                            if let yen = json["JPY"]{
                                self.japanLabel.text = self.doubleToMoney(yen, "JPY")
                                UserDefaults.standard.set(yen, forKey: "jpy")
                            }
                            if let eur = json["EUR"]{
                                self.euroLabel.text = self.doubleToMoney(eur, "EUR")
                                UserDefaults.standard.set(eur, forKey: "eur")
                            }
                            let formatter = DateFormatter()
                            formatter.dateFormat = "yyyy/MM/dd HH:mm"
                            self.lastUpdatedLabel.text = "Last Updated: " + formatter.string(from: Date.init())
                            UserDefaults.standard.synchronize()
                        }
                    }
                } else {
                    print("It broke!")
                    print(error)
                }
            }).resume()
        }
    }

    func doubleToMoney(_ price: Double, _ currencyCode: String) -> String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currencyCode
        if let priceString = formatter.string(from: NSNumber(value: price)){
            return priceString
        } else {
            return "ERROR"
        }

    }

}

