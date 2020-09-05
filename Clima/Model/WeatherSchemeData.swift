//
//  WeatherModel.swift
//  Clima
//
//  Created by Roelan Geil Eroy on 9/4/20.
//
import Foundation

struct WeatherSchemeData: Codable{
    let name: String?
    let main: Temp
    let weather: Array<Weather>
}

struct Temp: Codable{
    let temp: Double?
}

struct Weather: Codable{
    let description: String?
    let id: Int?
}
