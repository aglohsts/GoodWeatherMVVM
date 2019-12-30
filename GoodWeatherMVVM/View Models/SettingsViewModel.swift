//
//  SettingsViewModel.swift
//  GoodWeatherMVVM
//
//  Created by Agnes Lo on 2019/12/30.
//  Copyright © 2019 Agnes Lo. All rights reserved.
//

import Foundation

enum Unit: String, CaseIterable {
    
    case celsius = "metruc"
    case fahrenheit = "imperial"
}

extension Unit {
    
    var displayName: String {
        
        get {
            
            switch self {
                
            case .celsius: return "Celsius"
            case .fahrenheit: return "Fahrenheit"
            }
        }
    }
}

struct SettingsViewModel {
    
    let units = Unit.allCases
}

extension SettingsViewModel {
    
    
}
