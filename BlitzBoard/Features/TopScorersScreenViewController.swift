//  TopScorersScreenViewController.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/05/06.
//

import UIKit

class TopScorersScreenViewController: UIViewController {
    
    // MARK: IBOutlest
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Variables
    
    private lazy var viewModel = TopScorerScreenViewModel(repository: TopScorersRepository(), delegate: self)
    
    // MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.fetchTopScorers()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TopScorersScreenTableViewCell.tableViewNib(), 
                           forCellReuseIdentifier: TableViewIdentifiers.topScorersTableIdentifier)
        tableView.register(UINib(nibName: TableViewIdentifiers.topScorersHeaderIdentifier,
                                 bundle: nil),
                           forHeaderFooterViewReuseIdentifier: TableViewIdentifiers.topScorersHeaderIdentifier)
    }
}

    // MARK: Extensions

extension TopScorersScreenViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.topScorers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewIdentifiers.topScorersTableIdentifier) 
                as? TopScorersScreenTableViewCell
        else {
            return UITableViewCell()
        }
        let player = viewModel.topScorers[indexPath.row]
        cell.configure(topScorers: player)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: TableViewIdentifiers.topScorersHeaderIdentifier) as? TopScorersScreenHeaderView else {
            return UITableViewHeaderFooterView()
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
}
extension TopScorersScreenViewController: ViewModelDelegate {
    
    func reloadView() {
            self.tableView.reloadData()
    }
    
    func show(error: String) {
        
    }
}
