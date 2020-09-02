//
//  WeatherModel.swift
//  Clima
//
//  Created by Roelan Geil Eroy on 9/2/20.
//

struct WeatherModel{
    var API_URL = "http://api.openweathermap.org/data/2.5/weather?appid=3cb4c078118e262bc712c64b377023aa&units=metric";
    
    func fetchWeather(cityName:String){
        let url = "\(API_URL)&q=\(cityName)";
        print(url)
    }
}
