//
//  ViewController.swift
//  DetectThePic
//
//  Created by Matthew Kornfield on 5/2/19.
//  Copyright © 2019 Matthew Kornfield. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    @IBOutlet weak var imageField: UIImageView!
    @IBOutlet weak var tableView: UITableView!

    var resnetModel = Resnet50()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        if let image = imageField.image {
            processPicture(image: image)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "hello"
        return cell
    }

    func processPicture(image: UIImage) {
        if let model = try? VNCoreMLModel(for: resnetModel.model) {
            let request = VNCoreMLRequest(model: model) { (request, error) in
                if let results = request.results as? [VNClassificationObservation] {
                    print(results)
                }
            }
            if let imageData = image.jpegData(compressionQuality: 1.0) {
                let handler =  VNImageRequestHandler(data: imageData, options: [:])
                try? handler.perform([request])
            }
        }
    }

}

