//
//  HomeScreenHeaderView.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/05/17.
//

import UIKit

class HomeScreenHeaderView: UITableViewHeaderFooterView {
    
    // MARK: Function
    
    static func tableViewNib() -> UINib {
        UINib(nibName: TableViewIdentifiers.headerViewIdentifier, bundle: nil)
    }
}
