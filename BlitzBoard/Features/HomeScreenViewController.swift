// HomeScreenViewController.swift
// BlitzBoard
//
// Created by Kiasha Rangasamy on 2024/04/11.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var wallpapers: UIImageView!
    
    // MARK: Private variables
    
    private lazy var viewModel = HomeScreenViewModel(repository: HomeScreenRepository(), delegate: self)
    
    // MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.fetchLeagueTable()
    }
    
    // MARK: Private Functions
    
    private func setupTableView() {
        tableView.register(HomeScreenTableViewCell.tableViewNib(), forCellReuseIdentifier: TableViewIdentifiers.customCellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: Extensions

extension HomeScreenViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.fetchNumberOfTeams
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewIdentifiers.customCellIdentifier)
                as? HomeScreenTableViewCell
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

extension HomeScreenViewController: ViewModelDelegate {
    
    func reloadView() {
    }

    func show(error: String) {
    }
}
