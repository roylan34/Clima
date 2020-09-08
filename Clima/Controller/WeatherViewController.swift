//
//  ViewController.swift
//  Clima
//
//  Created by Roelan Geil Eroy on 08/29/2020.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    var weather = WeatherManager();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        searchTextField.delegate = self;
        weather.delegate = self;
    }
    
    @IBAction func onSearch(){
        searchTextField.endEditing(true);
        print(searchTextField.text!)
    }

}

//MARK: - UITextFieldDelegate
extension WeatherViewController: UITextFieldDelegate{
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

//MARK: - WeatherDelegate
extension WeatherViewController: WeatherManagerDelegate{
    func didUpdateWeather(_ weatherData: WeatherModel) {
           DispatchQueue.main.async {
               self.temperatureLabel.text = weatherData.temperatureString
               self.cityLabel.text = weatherData.cityName
               self.conditionImageView.image = UIImage(systemName: weatherData.conditionName )
           }
       }
       
       func didFailedWithError(_ error: Error) {
           print("Eroyzz");
           print(error);
       }
}

