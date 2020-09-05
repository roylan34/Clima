//
//  WeatherMisc.swift
//  Clima
//
//  Created by Roelan Geil Eroy on 9/5/20.
//

import Foundation

struct WeatherUtils {
    
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    //Computed properties
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 801...804:
            return "cloud.fill"
        default:
            return "cloud"
        }
        
    }
    
    var temperatureString: String{
        return String(format: "%.0f",temperature);
    }
    
}
