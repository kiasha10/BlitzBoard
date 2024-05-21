//  FixturesModel.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/05/19.
//

import Foundation

// MARK: - Fixtures Model

struct FixturesModel: Codable {
    var matchDate: String
    let matchTime: String
    let matchHometeamName: String
    let matchAwayteamName: String
    let matchStadium: String
    let teamHomeBadge: String
    let teamAwayBadge: String
    
    enum CodingKeys: String, CodingKey {
        case matchDate = "match_date"
        case matchTime = "match_time"
        case matchHometeamName = "match_hometeam_name"
        case matchAwayteamName = "match_awayteam_name"
        case matchStadium = "match_stadium"
        case teamHomeBadge = "team_home_badge"
        case teamAwayBadge = "team_away_badge"
    }
}
