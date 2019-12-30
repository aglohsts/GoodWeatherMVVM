//
//  AddWeatherCityViewController.swift
//  GoodWeatherMVVM
//
//  Created by Agnes Lo on 2019/12/27.
//  Copyright © 2019 Agnes Lo. All rights reserved.
//

import Foundation
import UIKit

protocol AddWeatherDelegate {
    
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {
    
    var delegate: AddWeatherDelegate?
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    @IBAction func saveCityButtonPressed() {
        
        if let cityName = cityNameTextField.text {
            
            let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&APPID=8b9f95e415d78efcc9939812af370342&units=imperial")!
            
            let weatherResource = Resource<WeatherViewModel>(url: weatherURL, parse: { (data) in
                
                let weatherVM = try? JSONDecoder().decode(WeatherViewModel.self, from: data)
                
                return weatherVM
            })
            
            Webservice().load(resource: weatherResource, completion: { [weak self] (result) in
                
                if let weatherVM = result {
                    
                    if let delegate = self?.delegate {
                        
                        delegate.addWeatherDidSave(vm: weatherVM)
                        self?.dismiss(animated: true, completion: nil)
                    }
                }
            })
        }
        
        
    }
    
    @IBAction func close() {
        
        self.dismiss(animated: true, completion: nil)
    }
}
