//
//  WeatherListViewModel.swift
//  GoodWeatherMVVM
//
//  Created by lohsts on 2019/12/28.
//  Copyright © 2019 Agnes Lo. All rights reserved.
//

import Foundation

struct WeatherListViewModel {
    
    private var weatherViewModel: [WeatherViewModel] = []
    
    mutating func addWeatherViewModel(_ vm: WeatherViewModel) {
        self.weatherViewModel.append(vm)
    }
    
    func numberOfRows(_ section: Int) -> Int {
        
        return self.weatherViewModel.count
    }
    
    func modelAt(_ index: Int) -> WeatherViewModel {
        
        return weatherViewModel[index]
    }
}

struct WeatherViewModel: Decodable {
    
    let name: String
    let currentTemperature: TemperatureViewModel
    
    private enum CodingKeys: String, CodingKey {
        
        case name
        case currentTemperature = "main"
    }
}

struct TemperatureViewModel: Decodable {
    
    let temperature: Double
    let temperatureMin: Double
    let temperatureMax: Double
    
    private enum CodingKeys: String, CodingKey {
        
        case temperature = "temp"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
    }
}
