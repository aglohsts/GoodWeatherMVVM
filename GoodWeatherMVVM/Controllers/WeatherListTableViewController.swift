//
//  WeatherListTableViewController.swift
//  GoodWeatherMVVM
//
//  Created by Agnes Lo on 2019/12/27.
//  Copyright © 2019 Agnes Lo. All rights reserved.
//

import Foundation
import UIKit

class WeatherListTableViewController: UITableViewController {
    
    private struct Segue {
        static let settings = "SettingsTableViewControllerSegue"
        static let addWeatherCity = "AddWeatherCityTableViewControllerSegue"
        static let weatherDetail = "WeatherDetailsViewControllerSegue"
    }
    
    private var weatherListViewModel = WeatherListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
            
        case Segue.addWeatherCity: prepareSegueForAddWeatherCityViewController(segue: segue)
            
        case Segue.settings: prepareSegueForSettingsViewController(segue: segue)
            
        case Segue.weatherDetail: prepareSegueForWeatherDetailViewController(segue: segue)
            
        default: return
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherListViewModel.numberOfRows(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let weatherVM = weatherListViewModel.modelAt(indexPath.row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: WeatherTableViewCell.self), for: indexPath)
        
        guard let weatherTableViewCell = cell as? WeatherTableViewCell else { return cell }
        
        weatherTableViewCell.configure(weatherVM)
        
        return cell
    }
}

extension WeatherListTableViewController: AddWeatherDelegate {
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        
        self.weatherListViewModel.addWeatherViewModel(vm)
        
        self.tableView.reloadData()
    }
}

extension WeatherListTableViewController: SettingsDelegate {
    
    func settingsDone(vm: SettingsViewModel) {
        
        self.weatherListViewModel.updateUnit(to: vm.selectedUnit)
        self.tableView.reloadData()
    }
}

extension WeatherListTableViewController { // private
    
    private func prepareSegueForAddWeatherCityViewController(segue: UIStoryboardSegue) {
        
        guard let navController = segue.destination as? UINavigationController else { fatalError("NavigationController not found") }
        
        guard let addWeatherCityVC = navController.viewControllers.first as? AddWeatherCityViewController else {
            fatalError("AddWeatherCityViewController not found")
        }
        
        addWeatherCityVC.delegate = self
    }
    
    private func prepareSegueForSettingsViewController(segue: UIStoryboardSegue) {
        
        guard let navController = segue.destination as? UINavigationController else { fatalError("NavigationController not found") }
        
        guard let settingsTableVC = navController.viewControllers.first as? SettingsTableViewController else {

            fatalError("SettingsTableViewController not found")
        }

        settingsTableVC.delegate = self
    }
    
    private func prepareSegueForWeatherDetailViewController(segue: UIStoryboardSegue) {
        
        guard let weatherDetailsVC = segue.destination as? WeatherDetailsViewController, let indexPath = tableView.indexPathForSelectedRow else { return }
        
        let weatherVM = self.weatherListViewModel.modelAt(indexPath.row)
        weatherDetailsVC.weatherViewModel = weatherVM
    }
}
