//
//  Double+Extension.swift
//  GoodWeatherMVVM
//
//  Created by lohsts on 2019/12/29.
//  Copyright © 2019 Agnes Lo. All rights reserved.
//

import Foundation

extension Double {
    
    var formatAsDegree: String {
        
        return String(format: "%.0f°", self)
    }
}
