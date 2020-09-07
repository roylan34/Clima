//
//  WeatherManagerDelegate.swift
//  Clima
//
//  Created by Roelan Geil Eroy on 9/7/20.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherData: WeatherModel);
    func didFailedWithError(_ error: Error);
}
