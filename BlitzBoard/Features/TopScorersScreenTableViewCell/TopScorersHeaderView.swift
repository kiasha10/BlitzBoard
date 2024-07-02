//
//  TopScorersHeaderView.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/06/28.
//

import UIKit

class TopScorersScreenHeaderView: UITableViewHeaderFooterView {
    
    // MARK: Function
    
    static func tableViewNib() -> UINib {
        UINib(nibName: TableViewIdentifiers.topScorersHeaderIdentifier, bundle: nil)
    }
}
