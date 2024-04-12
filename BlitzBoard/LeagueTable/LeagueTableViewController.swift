//
//  LeagueTableViewController.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/04/11.
//


import UIKit

class LeagueTableViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    

    private lazy var viewModel = LeagueTableViewModel(repository:LeagueTableRepository(), delegate: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call League Table
        viewModel.fetchLeagueTable()

    }
}

// MARK: - ViewModel Delegate

extension LeagueTableViewController: ViewModelDelegate {
    
    func reloadView() {
        tableView.reloadData()
    }
    
    func show(error: String) {
//        displayAlert(title: "Error", message: error, buttonTitle: "Ok")
    }
}
