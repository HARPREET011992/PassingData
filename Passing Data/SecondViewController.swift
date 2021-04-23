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

class SecondViewController: UIViewController,UITextFieldDelegate {
    var delegate : CanReceive?
    var data = ""
    @IBOutlet weak var Label: UILabel!
    
    @IBOutlet weak var TextField: UITextField!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        Label.text = data
        TextField.delegate = self
    }
    @IBAction func Back(_ sender: UIButton) {
        if TextField.text == "" {
            let alert = UIAlertController(title:"Attention", message: "please write something to send another view controller", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            delegate?.dataReceived(data: TextField.text!)
            dismiss(animated: true, completion: nil)
        }}
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        TextField.text = ""
    }
    
}
