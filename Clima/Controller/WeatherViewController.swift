//
//  ViewController.swift
//  Clima
//
//  Created by Roelan Geil Eroy on 08/29/2020.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    var weather = WeatherModel();
    
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
            return true;
        }
        else{
            searchTextField.placeholder="Type something.."
            return false;
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let search = searchTextField.text {
            weather.fetchWeather(cityName: search)
            
        }
        searchTextField.placeholder = "Search";
        searchTextField.text = "";
        
    }


}

