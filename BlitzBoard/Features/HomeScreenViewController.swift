// HomeScreenViewController.swift
// BlitzBoard
//
// Created by Kiasha Rangasamy on 2024/04/11.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    
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
        
        tableView.layer.borderWidth = 5.0
        tableView.layer.borderColor = UIColor.purple.cgColor
        tableView.layer.cornerRadius = 10
    }
}

// MARK: Extensions

extension HomeScreenViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        headerView.backgroundColor = .darkGray
        
        let positionLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 50, height: 50))
        positionLabel.text = "Pos"
        positionLabel.textAlignment = .center
        headerView.addSubview(positionLabel)
        
        let teamNameLabel = UILabel(frame: CGRect(x: 70, y: 0, width: 150, height: 50))
        teamNameLabel.text = "Team"
        teamNameLabel.textAlignment = .center
        headerView.addSubview(teamNameLabel)
        
        let winsLabel = UILabel(frame: CGRect(x: 230, y: 0, width: 50, height: 50))
        winsLabel.text = "W"
        headerView.addSubview(winsLabel)
        
        let drawsLabel = UILabel(frame: CGRect(x: 290, y: 0, width: 50, height: 50))
        drawsLabel.text = "D"
        headerView.addSubview(drawsLabel)
        
        let lossesLabel = UILabel(frame: CGRect(x: 350, y: 0, width: 50, height: 50))
        lossesLabel.text = "L"
        headerView.addSubview(lossesLabel)
        
        return headerView
    }
    
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
        cell.configure(teamStanding: teamStanding)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}

extension HomeScreenViewController: ViewModelDelegate {
    func reloadView() {
        tableView.reloadData()
    }
    
    func show(error: String) {
    }
}
