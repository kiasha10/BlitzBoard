//  FixturesScreenViewController.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/05/06.
//

import UIKit

class FixturesScreenViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: Variables
    
    var fixtures: [FixturesModel] = []
    private lazy var viewModel = FixturesScreenViewModel(repository: FixturesScreenRepository(), delegate: self )
    
    // MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.fetchFixtures()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FixturesScreenTableViewCell.tableViewNib(), forCellReuseIdentifier: TableViewIdentifiers.fixtureTableIdentifier)
        tableView.layer.borderWidth = 6.0
        tableView.layer.borderColor = UIColor.lightGray.cgColor
    }
}

    // MARK: - Extensions

extension FixturesScreenViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.fetchNumberOfGames
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewIdentifiers.fixtureTableIdentifier)
                as? FixturesScreenTableViewCell
        else {
            return UITableViewCell()
        }
        let gameFixture = viewModel.fixtures[indexPath.row]
        cell.configure(gameFixtures: gameFixture, matchDate: viewModel.matchDate(result: gameFixture.matchDate))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        107
    }
}

extension FixturesScreenViewController: ViewModelDelegate {
    func reloadView() {
        tableView.reloadData()
    }
    
    func show(error: String) {
    }
}
