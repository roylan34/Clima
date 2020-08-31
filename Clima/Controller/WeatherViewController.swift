//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        searchTextField.delegate = self;
    }
    
    @IBAction func onSearch(){
        searchTextField.endEditing(true);
        print(searchTextField.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true);
        print(searchTextField.text!);
        return true;
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
       //can use textField.text on above if we dont care what textfield could trigger.
        if(searchTextField.text != ""){
            searchTextField.placeholder = "Search";
            searchTextField.text = "";
            return true;
        }
        else{
            searchTextField.placeholder="Type something.."
            return false;
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        searchTextField.text = "";
    }


}

