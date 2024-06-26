//  TopScorersScreenViewController.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/05/06.
//

import UIKit

class TopScorersScreenViewController: UIViewController {
    
    // MARK: IBOutlest
    
    @IBOutlet weak var wallpaper3: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Variables
    
    private lazy var viewModel = TopScorerViewModel()
    
    // MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.fetchTopScorers()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}
    // MARK: Extensions

extension TopScorersScreenViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.topScorers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewIdentifiers.topScorersTableIdentifier) as? TopScorersScreenTableViewCell
        else {
            return UITableViewCell()
        }
        let player = viewModel.topScorers[indexPath.row]
        cell.configure(topScorers: player)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        115
    }
}
extension TopScorersScreenViewController : ViewModelDelegate {
    
    func reloadView() {
            self.tableView.reloadData()
    }
    
    func show(error: String) {
        
    }
}
