//
//  SettingsViewModelTests.swift
//  GoodWeatherMVVMTests
//
//  Created by Agnes Lo on 2020/1/2.
//  Copyright © 2020 Agnes Lo. All rights reserved.
//

import XCTest
@testable import GoodWeatherMVVM

class SettingsViewModelTests: XCTestCase {
    
    private var settingsVM = SettingsViewModel()
    
    override class func setUp() {
        super.setUp()
        
        
    }

    func test_should_make_sure_that_default_selected_unit_is_fahernheit() {
        
        XCTAssertEqual(settingsVM.selectedUnit, .fahrenheit)
    }

    func test_should_return_correct_display_name_for_fahenheit() {
        
        XCTAssertEqual(settingsVM.selectedUnit.displayName, "Fahrenheit")
    }
    
    func test_should_be_able_to_save_user_unit_selection() {
        
        self.settingsVM.selectedUnit = .celsius
        
        let userDefaults = UserDefaults.standard
        XCTAssertNotNil(userDefaults.value(forKey: "unit"))
    }
    
    override func tearDown() { // fired after each test case is run
        super.tearDown()
        
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "unit")
    }
}
