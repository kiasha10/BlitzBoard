//
//  LeagueTableViewController.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/04/11.
//


import UIKit

class LeagueTableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var leagueTable: [LeagueTableModel] = [] 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        fetchLeagueTable()
    }
    
    func fetchLeagueTable() {
        guard let url = URL(string: " https://apiv3.apifootball.com/?action=get_standings&league_id=152&APIkey=afd5a1ede5598029ca62b14f758edd87481d42c83fecb45afb8fa613c50efb7c") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self else { return }
            guard let data = data, error == nil else {
                print("Failed to fetch data: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                self.leagueTable = try JSONDecoder().decode([LeagueTableModel].self, from: data)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("Failed to decode JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}

extension LeagueTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagueTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StandingCell", for: indexPath) as? StandingTableViewCell else {
            fatalError("Unable to dequeue StandingTableViewCell")
        }
        
        let teamStanding = leagueTable[indexPath.row]
        cell.configure(with: teamStanding)
        
        return cell
    }
}

extension LeagueTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 20
    }
}

