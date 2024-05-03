//
//  TableViewCellViewController.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/04/17.
//

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
    static func tableViewNib() -> UINib {
        return UINib(nibName: TableViewIdentifiers.customCellIdentifier, bundle: nil)
    }
}
