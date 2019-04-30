//
//  CreateCollectableViewController.swift
//  Collector
//
//  Created by Matthew Kornfield on 4/30/19.
//  Copyright © 2019 Matthew Kornfield. All rights reserved.
//

import UIKit

class CreateCollectableViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    var pickerController = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerController.delegate = self
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
    }

    @IBAction func mediaTapped(_ sender: Any) {
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    }

    @IBAction func cameraTapped(_ sender: Any) {
        pickerController.sourceType = .camera
        present(pickerController, animated: true, completion: nil)
    }

    @IBAction func addTapped(_ sender: Any) {
    }

}
