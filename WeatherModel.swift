//
//  WeatherModel.swift
//  Clima
//
//  Created by Roelan Geil Eroy on 9/2/20.
//
import Foundation

struct WeatherModel{
    private var API_URL = "https://api.openweathermap.org/data/2.5/weather?appid=3cb4c078118e262bc712c64b377023aa&units=metric";
    
    func fetchWeather(cityName:String){
        let urlSource = "\(API_URL)&q=\(cityName)";
        
        if let url =  URL(string: urlSource) {
            
            let session = URLSession(configuration: .default)
            
//          let task = session.dataTask(with: url, completionHandler: sessionCompleteHandler(data:response:error:))
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!);
                    return
                }
                
                if let returnData = data {
                    self.parseJSON(weatherData: returnData)
                }
            }
            task.resume()
        }
        
    }
    
//    func sessionCompleteHandler(data: Data?, response: URLResponse?, error: Error?) {
//        if error != nil {
//            print(error!);
//            return
//        }
//
//        if let returnData = data {
//            let jsonData = String(data: returnData, encoding: .utf8);
//            print(jsonData!);
//        }
//    }
    
    func parseJSON(weatherData: Data){
        let decoder = JSONDecoder()
        do{
           let dataDecoded = try decoder.decode(WeatherSchemeData.self, from: weatherData)
            let name = dataDecoded.name ?? ""
            let temp = dataDecoded.main.temp ?? 0
            let id = dataDecoded.weather[0].id ?? 0
            
            let weatherMiscRes = WeatherUtils(conditionId: id, cityName: name, temperature: temp)
            print(weatherMiscRes.conditionName)
            print(weatherMiscRes.temperatureString)
            
        }
        catch{
            print(error);
        }
    }
    
}
