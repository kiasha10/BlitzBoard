//
//  FixturesScreenViewController.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/05/06.
//
import UIKit

class FixturesScreenViewController: UIViewController {
    
    // MARK: Properties
    
    private lazy var viewModel = FixturesScreenViewModel(repository: FixturesScreenRepository(), delegate: self )
    var fixtures: [FixturesScreenModel] = []
    
    // MARK: IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
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
        tableView.layer.borderColor = UIColor.purple.cgColor
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

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
        viewModel.fetchFixtures()
        let gameFixture = viewModel.fixtures[indexPath.row]
        cell.configure(gameFixtures: gameFixture)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}

extension FixturesScreenViewController: ViewModelDelegate {
    func reloadView() {
        tableView.reloadData()
    }
    
    func show(error: String) {
    }
}
