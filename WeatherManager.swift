//
//  WeatherModel.swift
//  Clima
//
//  Created by Roelan Geil Eroy on 9/2/20.
//
import Foundation

struct WeatherManager{
    private var API_URL = "https://api.openweathermap.org/data/2.5/weather?appid=3cb4c078118e262bc712c64b377023aa&units=metric";
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName:String){
        let urlSource = "\(API_URL)&q=\(cityName)";
        
        if let url =  URL(string: urlSource) {
            
            let session = URLSession(configuration: .default)
            
            //          let task = session.dataTask(with: url, completionHandler: sessionCompleteHandler(data:response:error:))
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailedWithError(error!)
                    return
                }
                
                if let returnData = data {
                    if let weatherData = self.parseJSON(returnData){
                        self.delegate?.didUpdateWeather(weatherData)
                    }
                    
                    
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
    
    func parseJSON(_ weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        
        do{
            let dataDecoded = try decoder.decode(WeatherSchemeData.self, from: weatherData)
            let name = dataDecoded.name ?? ""
            let temp = dataDecoded.main.temp ?? 0
            let id = dataDecoded.weather[0].id ?? 0
            
            let weatherMiscRes = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weatherMiscRes;
            
        }
        catch{
            self.delegate?.didFailedWithError(error)
            return nil;
            
        }
    }
    
}
