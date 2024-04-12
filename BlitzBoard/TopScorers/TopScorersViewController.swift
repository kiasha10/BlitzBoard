//
//  TopScorersViewController.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/04/11.
//

import Foundation

import UIKit

class TopScorerViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    
    private let viewModel = TopScorerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call ViewModel to fetch top scorers
        viewModel.fetchTopScorers()
            }
        }

