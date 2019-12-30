//
//  BindingTextField.swift
//  GoodWeatherMVVM
//
//  Created by Agnes Lo on 2019/12/30.
//  Copyright © 2019 Agnes Lo. All rights reserved.
//

import Foundation
import UIKit

class BindingTextField: UITextField {
    
    var textChangeClosure: (String) -> () = { _ in }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func bind(callback: @escaping (String) -> ()) {
        
        self.textChangeClosure = callback
    }
    
    private func commonInit() {
        
        self.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
    }
    
    @objc func textFieldChange(_ textField: UITextField) {
        
        if let text = textField.text {
            
            self.textChangeClosure(text)
        }
    }
}
