// LeagueTableViewController.swift
// BlitzBoard
//
// Created by Kiasha Rangasamy on 2024/04/11.
//

import UIKit

class LeagueTableViewController: UIViewController, ViewModelDelegate {
    
    func reloadView() {
    }
    
    func show(error: String) {
    }
    
    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    private lazy var viewModel = LeagueTableViewModel(repository: LeagueTableRepository(), delegate: self)
    
    @IBOutlet weak var wallpapers: UIImageView!
    var leagueTable: [LeagueTableModel] = []
    
    // MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.fetchLeagueTable()
    }
    
    private func setupTableView() {
        tableView.register(StandingTableViewCell.tableViewNib(),
                           forCellReuseIdentifier: TableViewIdentifiers.customCellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension LeagueTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getNumberOfTeams()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewIdentifiers.customCellIdentifier) as? StandingTableViewCell
        else {
            
            return UITableViewCell()
        }
        
        let teamStanding = viewModel.leagueTables[indexPath.row]
        cell.configure(with: teamStanding)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        20
    }
}
