//
//  TableViewCellViewController.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/04/17.
//
//
//import UIKit
//
//class TableViewCellViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}


import UIKit

class StandingTableViewCell: UITableViewCell {
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var teamLogoImageView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var winsLabel: UILabel!
    @IBOutlet weak var drawsLabel: UILabel!
    @IBOutlet weak var lossesLabel: UILabel!
    
    func configure(with teamStanding: LeagueTableModel) {
        positionLabel.text = teamStanding.overallLeaguePosition
        teamNameLabel.text = teamStanding.teamName
        winsLabel.text = "Wins: \(teamStanding.overallLeagueW)"
        drawsLabel.text = "Draws: \(teamStanding.overallLeagueD)"
        lossesLabel.text = "Losses: \(teamStanding.overallLeagueL)"
    }
}
class StandingsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var leagueTable: LeagueTable = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension StandingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAT indexPath: IndexPath) {
        performSegue(withIdentifier: "pageSceenSegue", sender: leagueTable[indexPath.row])
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagueTable.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell
        cell.title.text = leagueTable[indexPath.row]
        return cell
    }
}
extension StandingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 20 // Adjust the height as needed
    }
}
