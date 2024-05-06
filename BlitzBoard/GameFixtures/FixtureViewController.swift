//
//  FixtureViewController.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/04/11.
//
import UIKit

class FixturesViewController: UIViewController, ViewModelDelegate {
    // MARK: Properties
    private lazy var viewModel = FixturesViewModel(repository: FixturesRepository())
    var fixtures: [FixturesModel] = []
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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    // MARK: ViewModelDelegate
    func reloadView() {
        tableView.reloadData()
    }
    func show(error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
    }
}
// MARK: - UITableViewDataSource, UITableViewDelegate
extension FixturesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         fixtures.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let fixture = fixtures[indexPath.row]
        // Configure cell with fixture details
        cell.textLabel?.text = "\(fixture.matchHometeamName) vs \(fixture.matchAwayteamName)"
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         44
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle row selection if needed
    }
}
