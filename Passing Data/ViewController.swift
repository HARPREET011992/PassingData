//
//  ViewController.swift
//  Passing Data
//
//  Created by Happy on 25/03/19.
//  Copyright © 2019 Happy. All rights reserved.
//

import UIKit

class ViewController: UIViewController,CanReceive, UITextFieldDelegate{
    
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var TextField1: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        TextField1.delegate = self
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        TextField1.text = ""
    }
    @IBAction func SEND(_ sender: UIButton) {
        if TextField1.text == "" {
            let alert = UIAlertController(title:"Attention", message: "please write something to send another view controller", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: "SEND", sender:self)
        }}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SEND"{
            let SecondVC = segue.destination as! SecondViewController
            SecondVC.data = TextField1.text!
            SecondVC.delegate = self
            
        }
        
    }
    func dataReceived(data:String)  {
        Label1.text = data
    }
}

