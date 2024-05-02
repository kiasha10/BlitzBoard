//
//  TopScorersViewController.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/04/11.
//
import UIKit

class TopScorersViewController: UIViewController {
    

    @IBOutlet weak var wallpaper3: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    

    let viewModel = TopScorerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.fetchTopScorers()
        viewModel.didUpdateData = { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension TopScorersViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.topScorers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let player = viewModel.topScorers[indexPath.row]
        cell.textLabel?.text = "\(player.playerName) - Goals: \(player.goals)"
        return cell
    }
}
