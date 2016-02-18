//
//  NetworkController.swift
//  Weather
//
//  Created by Cameron Moss on 2/17/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//
//APPID=4eba9edf714e3a89c403d5d8f492efcc

import Foundation
import UIKit

class NetworkController {
    
    private static let API_KEY = "4eba9edf714e3a89c403d5d8f492efcc"
    static let baseURL = "http://api.openweathermap.org/data/2.5/weather"
    
    static func searchURLByCity(city: String) -> NSURL {
        let cityString = city.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet())
        
        return NSURL(string: baseURL + "?q=\(cityString!)" + "&appid=\(API_KEY)")!
    }
    
    
    static func dataAtURL(url: NSURL, completion:(resultData: NSData?) -> Void) {
        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithURL(url) { (data, _, error) -> Void in
            
            guard let data = data  else {
                print(error?.localizedDescription)
                completion(resultData: nil)
                return
            }
            
            completion(resultData: data)
        }
        
        dataTask.resume()
    }
    
}