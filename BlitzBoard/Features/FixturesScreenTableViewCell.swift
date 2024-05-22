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
    @IBOutlet private weak var matchStadium: UILabel!
    
    // MARK: Functions
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = 30
        contentView.layer.masksToBounds = true
        contentView.layer.borderWidth = 6
        contentView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func configure(gameFixtures: FixturesModel, matchDate: DateComponents) {
        self.matchDate.text = "\(matchDate.day ?? 0) \(MonthConverter.matchDateMonths[(matchDate.month ?? 1) - 1])"
        homeTeamName.text = convertToShorthand(teamName: gameFixtures.matchHometeamName)
        matchTime.text = "\(gameFixtures.matchTime)"
        awayTeamName.text = convertToShorthand(teamName: gameFixtures.matchAwayteamName)
        matchStadium.text = "\(gameFixtures.matchStadium)"
        homeTeamLogo.load(urlString: gameFixtures.teamHomeBadge)
        awayTeamLogo.load(urlString: gameFixtures.teamAwayBadge)
    }
    
    static func tableViewNib() -> UINib {
        UINib(nibName: TableViewIdentifiers.fixtureTableIdentifier, bundle: nil)
    }
}
