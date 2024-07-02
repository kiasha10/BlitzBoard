//  TopScorersScreenTableViewCell.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/06/26.
//

import UIKit

class TopScorersScreenTableViewCell: UITableViewCell {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var playerPlace: UILabel!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var teamLogo: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    
    // MARK: Functions
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(topScorers: PlayerModel) {
        playerPlace.text = "\(topScorers.playerPlace)"
        playerName.text = convertToShorthand(playerName: topScorers.playerName)
        teamName.text = convertTeamToShorthand(teamName: topScorers.teamName)
    }
    
    static func tableViewNib() -> UINib {
        UINib(nibName: TableViewIdentifiers.topScorersTableIdentifier, bundle: nil)
    }
}
