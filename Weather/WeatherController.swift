//
//  WeatherController.swift
//  Weather
//
//  Created by Cameron Moss on 2/17/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class WeatherController {
    
    static func getWeather(city: String, completion: (result: Weather?) -> Void) {
        
        let url = NetworkController.searchURLByCity(city)
        
        NetworkController.dataAtURL(url) { (resultData) -> Void in
            
            guard let data = resultData else {
                print("No data returned")
                completion(result: nil)
                return
            }
            
            do {
                let weatherAnyObject = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
                
                var weatherModelObject: Weather?
                
                if let weatherDictionary = weatherAnyObject as? [String: AnyObject] {
                    weatherModelObject = Weather(jsonDictionary: weatherDictionary)
                }
                    completion(result: weatherModelObject)
                
            } catch {
                completion(result: nil)
            }
        }
        
    }

}