//
//  Webservice.swift
//  GoodWeatherMVVM
//
//  Created by lohsts on 2019/12/28.
//  Copyright © 2019 Agnes Lo. All rights reserved.
//

import Foundation

struct Resource<T> {
    
    let url: URL
    let parse: (Data?) -> T?
}

final class Webservice { // cannot inherit
    
    func load<T>(resource: Resource<T>, completion: @escaping (T?) -> ()) {
        
        URLSession.shared.dataTask(with: resource.url, completionHandler: { (data, response, error) in
            
            if let data = data {
                
                DispatchQueue.main.async {
                    
                    completion(resource.parse(data))
                }
            } else {
                
                completion(nil)
            }
            
        }).resume()
    }
}
