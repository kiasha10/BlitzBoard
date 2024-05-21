//  HomeScreenTableViewCell.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/04/17.
//

import UIKit

class HomeScreenTableViewCell: UITableViewCell {
    
    // MARK: IBOulets
    
    @IBOutlet private weak var positionLabel: UILabel!
    @IBOutlet private weak var teamLogo: UIImageView!
    @IBOutlet private weak var teamName: UILabel!
    @IBOutlet private weak var winsLabel: UILabel!
    @IBOutlet private weak var drawsLabel: UILabel!
    @IBOutlet private weak var lossesLabel: UILabel!
    
    // MARK: Function
    
    func configure(teamStanding: LeagueTableModel) {
        positionLabel.text = teamStanding.overallLeaguePosition
        teamName.text = convertToShorthand(teamName: teamStanding.teamName)
        winsLabel.text = "\(teamStanding.overallLeagueWin)"
        drawsLabel.text = "\(teamStanding.overallLeagueDraw)"
        lossesLabel.text = "\(teamStanding.overallLeagueLoss)"
        teamLogo.load(urlString: teamStanding.teamBadge)
    }
    
    static func tableViewNib() -> UINib {
        UINib(nibName: TableViewIdentifiers.customCellIdentifier, bundle: nil)
    }
}
