//
//  Weather.swift
//  Weather
//
//  Created by Cameron Moss on 2/17/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit

class Weather {
    
    static let weatherKey = "weather"
    static let mainKey = "main"
    static let descriptionKey = "description"
    static let iconStringKey = "iconString"
    static let cityNamekey = "name"
    static let tempKey = "temp"
    
    var main = ""
    var description = ""
    //var iconString = ""
    var cityName = ""
    var temperatureK: Float?
    var temperatureC: Float? {
        get {
            if let temperatureK = temperatureK {
                return temperatureK - 273.15
            } else {
                return nil
            }
        }
    }
    
    init(jsonDictionary: [String: AnyObject]) {
        
        if let arrayUsingWeatherKey = jsonDictionary[Weather.weatherKey] as? [[String: AnyObject]] {
            if let main = arrayUsingWeatherKey[0][Weather.mainKey] as? String {
                self.main = main
            }
            if let description = arrayUsingWeatherKey[0][Weather.descriptionKey] as? String {
                self.description = description
            }
            if let main = jsonDictionary[Weather.mainKey] as? [String: AnyObject] {
                if let temperature = main[Weather.tempKey] as? NSNumber {
                    self.temperatureK = Float(temperature)
                }
            }
            if let cityName = jsonDictionary[Weather.cityNamekey] as? String {
                self.cityName = cityName
            }
        }
    }
    
//        guard let main = jsonDictionary[mainKey] as? String, let description = jsonDictionary[descriptionKey] as? String, let cityName = jsonDictionary[cityNamekey] as? String, let temperatureK = jsonDictionary[tempKey] as? Float else {
//            self.main = ""
//            self.description = ""
//            //self.iconString = ""
//            self.cityName = ""
//            self.temperatureK = nil 
//            return
//        }
//        self.main = main
//        self.description = description
//        //self.iconString = iconString
//        self.cityName = cityName
//        self.temperatureK = temperatureK
//    
//    }
    
    
}
