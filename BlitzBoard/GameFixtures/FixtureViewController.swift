//
//  FixtureViewController.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/04/11.
//


import UIKit

class FixturesViewController: UIViewController {
    
   // @IBOutlet private var tableView: UITableView!
    
    private let viewModel = FixturesViewModel(repository: FixturesRepository())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call ViewModel to fetch top scorers
        viewModel.fetchFixtures()
        
    }
    
}
