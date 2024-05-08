//  HomeScreenTableViewCell.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/04/17.
//

import UIKit

class HomeScreenTableViewCell: UITableViewCell {
    
    // MARK: IBOulets
    
    @IBOutlet private weak var positionLabel: UILabel!
    @IBOutlet private weak var teamLogoImageView: UIImageView!
    @IBOutlet private weak var teamNameLabel: UILabel!
    @IBOutlet private weak var winsLabel: UILabel!
    @IBOutlet private weak var drawsLabel: UILabel!
    @IBOutlet private weak var lossesLabel: UILabel!
    
    // MARK: Function
    
    func configure(with teamStanding: LeagueTableModel) {
        positionLabel.text = teamStanding.overallLeaguePosition
        teamNameLabel.text = teamStanding.teamName
        winsLabel.text = "Wins: \(teamStanding.overallLeagueWin)"
        drawsLabel.text = "Draws: \(teamStanding.overallLeagueDraw)"
        lossesLabel.text = "Losses: \(teamStanding.overallLeagueLoss)"
    }
    
    static func tableViewNib() -> UINib {
        UINib(nibName: TableViewIdentifiers.customCellIdentifier, bundle: nil)
    }
}
