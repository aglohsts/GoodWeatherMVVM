//
//  AddWeatherCityViewController.swift
//  GoodWeatherMVVM
//
//  Created by Agnes Lo on 2019/12/27.
//  Copyright © 2019 Agnes Lo. All rights reserved.
//

import Foundation
import UIKit

class AddWeatherCityViewController: UIViewController {
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    @IBAction func saveCityButtonPressed() {
        
        if let cityName = cityNameTextField.text {
            
            let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&APPID=8b9f95e415d78efcc9939812af370342&units=imperial")!
            
            let weatherResource = Resource<Any>(url: weatherURL, parse: { (data) -> Any? in
                
                return data
            })
            
            Webservice().load(resource: weatherResource, completion: { (result) in
                
                
            })
        }
        
        
    }
    
    @IBAction func close() {
        
        self.dismiss(animated: true, completion: nil)
    }
}
