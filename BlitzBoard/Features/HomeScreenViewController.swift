// HomeScreenViewController.swift
// BlitzBoard
//
// Created by Kiasha Rangasamy on 2024/04/11.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var spinner: UIActivityIndicatorView!
    
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
        tableView.register(UINib(nibName: TableViewIdentifiers.headerViewIdentifier,
                                 bundle: nil),
                           forHeaderFooterViewReuseIdentifier: TableViewIdentifiers.headerViewIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.layer.borderWidth = 6.0
        tableView.layer.borderColor = UIColor.purple.cgColor
    }
}

// MARK: Extensions

extension HomeScreenViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfTeams
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewIdentifiers.customCellIdentifier)
                as? HomeScreenTableViewCell
        else {
            return UITableViewCell()
        }
        let teamStanding = viewModel.leagueTables[indexPath.row]
        cell.configure(teamStanding: teamStanding)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: TableViewIdentifiers.headerViewIdentifier) as? HomeScreenHeaderView else {
            return UITableViewHeaderFooterView()
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
}

extension HomeScreenViewController: ViewModelDelegate {
    
    func reloadView() {
            self.tableView.reloadData()
            self.spinner.isHidden = true
    }
    
    func show(error: String) {
        
    }
}
