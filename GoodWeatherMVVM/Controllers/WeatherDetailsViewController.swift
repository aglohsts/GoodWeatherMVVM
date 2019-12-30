//
//  WeatherDetailsController.swift
//  GoodWeatherMVVM
//
//  Created by Agnes Lo on 2019/12/30.
//  Copyright © 2019 Agnes Lo. All rights reserved.
//

import Foundation
import UIKit

class WeatherDetailsViewController: UIViewController {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTampLabel: UILabel!
    
    var weatherViewModel: WeatherViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cityNameLabel.text = self.weatherViewModel?.name
        self.currentTemperatureLabel.text = self.weatherViewModel?.currentTemperature.temperature.formatAsDegree
    }
}
