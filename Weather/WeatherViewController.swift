//
//  WeatherViewController.swift
//  Weather
//
//  Created by Cameron Moss on 2/17/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            WeatherController.getWeather(searchText) { (result) in
                guard let weatherResult = result else { return }
                
                dispatch_async(dispatch_get_main_queue()) { () in
                    self.cityNameLabel.text = weatherResult.cityName
                    if let temperatureC = weatherResult.temperatureC {
                        self.temperatureLabel.text = String(temperatureC) + " °C"
                    } else {
                        self.temperatureLabel.text = "No temperature available"
                    }
                    self.descriptionLabel.text = weatherResult.main
                    self.descriptionLabel.text = weatherResult.description
                }
                
            }
        }
        searchBar.resignFirstResponder()
    }
}
