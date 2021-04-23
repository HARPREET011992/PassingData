//
//  SecondViewController.swift
//  Passing Data
//
//  Created by Happy on 25/03/19.
//  Copyright © 2019 Happy. All rights reserved.
//
import UIKit
protocol CanReceive {
    func dataReceived(data: String)

}

class SecondViewController: UIViewController {
    var delegate : CanReceive?
    var data = ""
 @IBOutlet weak var Label: UILabel!
    
    @IBOutlet weak var TextField: UITextField!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        Label.text = data
    }
    @IBAction func Back(_ sender: UIButton) {
     delegate?.dataReceived(data: TextField.text!)
        dismiss(animated: true, completion: nil)
    }
    func textFieldDidBeginEditing(textField: UITextField) {
        TextField.text = ""
    }

}
