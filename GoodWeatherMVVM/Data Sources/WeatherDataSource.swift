//
//  WeatherDataSource.swift
//  GoodWeatherMVVM
//
//  Created by lohsts on 2020/1/1.
//  Copyright © 2020 Agnes Lo. All rights reserved.
//

import Foundation
import UIKit

class WeatherDataSource: NSObject, UITableViewDataSource {
    
    let cellIdentifier: String = String(describing: WeatherTableViewCell.self)
    private var weatherListViewModel: WeatherListViewModel
    
    init(_ weatherListViewModel: WeatherListViewModel) {
        
//        self.cellIdentifier = cellIdentifier
        self.weatherListViewModel = weatherListViewModel
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.weatherViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        guard let weatherTableViewCell = cell as? WeatherTableViewCell else { return cell }
        
        let weatherVM = self.weatherListViewModel.modelAt(indexPath.row)
        
        weatherTableViewCell.cityNameLabel.text = weatherVM.name.value
        weatherTableViewCell.temperatureLabel.text = weatherVM.currentTemperature.temperature.value.formatAsDegree
        
        return weatherTableViewCell
    }
}
