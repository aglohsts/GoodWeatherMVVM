//
//  TableViewDataSource.swift
//  GoodWeatherMVVM
//
//  Created by Agnes Lo on 2020/1/2.
//  Copyright © 2020 Agnes Lo. All rights reserved.
//

import Foundation
import UIKit

class TableViewDataSource<CellType, ViewModel>: NSObject, UITableViewDataSource where CellType: UITableViewCell {
    
    let cellIdentifier: String
    var items: [ViewModel]
    let configureCell: (CellType, ViewModel) -> ()
    
    init(cellIdentifier: String, items: [ViewModel], configureCell: @escaping (CellType, ViewModel) -> ()) {
        
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        guard let cell = tableViewCell as? CellType else { return tableViewCell }
        
        let vm = self.items[indexPath.row]
        
        self.configureCell(cell, vm)
        
        return cell
    }
}
