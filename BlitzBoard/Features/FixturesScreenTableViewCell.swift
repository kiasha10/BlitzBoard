//  FixturesScreenTableViewCell.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/05/19.
//
import UIKit

class FixturesScreenTableViewCell: UITableViewCell {
    
    // MARK: IBOulets
    
    @IBOutlet private weak var matchDate: UILabel!
    @IBOutlet private weak var homeTeamName: UILabel!
    @IBOutlet private weak var homeTeamLogo: UIImageView!
    @IBOutlet private weak var matchTime: UILabel!
    @IBOutlet private weak var awayTeamName: UILabel!
    @IBOutlet private weak var awayTeamLogo: UIImageView!
    @IBOutlet weak var matchStadium: UILabel!
    
    func configure(gameFixtures: FixturesScreenModel) {
        matchDate.text = gameFixtures.matchDate
        homeTeamName.text = "\(gameFixtures.matchHometeamName)"
        matchTime.text = "\(gameFixtures.matchTime)"
        awayTeamName.text = "\(gameFixtures.matchAwayteamName)"
        matchStadium.text = "\(gameFixtures.matchStadium)"
        homeTeamLogo.load(urlString: gameFixtures.teamHomeBadge)
        awayTeamLogo.load(urlString: gameFixtures.teamAwayBadge)
    }
    
    static func tableViewNib() -> UINib {
        UINib(nibName: TableViewIdentifiers.fixtureTableIdentifier, bundle: nil)
    }
}
