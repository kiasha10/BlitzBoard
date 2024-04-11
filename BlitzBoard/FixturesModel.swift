//
//  FixturesModel.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/04/03.
//

import Foundation

// MARK: - Fixtures
struct FixturesModel: Codable {
    let matchID, countryID, countryName, leagueID: String
    let leagueName, matchDate, matchStatus, matchTime: String
    let matchHometeamID, matchHometeamName, matchHometeamScore, matchAwayteamName: String
    let matchAwayteamID, matchAwayteamScore, matchHometeamHalftimeScore, matchAwayteamHalftimeScore: String
    let matchHometeamExtraScore, matchAwayteamExtraScore, matchHometeamPenaltyScore, matchAwayteamPenaltyScore: String
    let matchHometeamFtScore, matchAwayteamFtScore, matchHometeamSystem, matchAwayteamSystem: String
    let matchLive, matchRound, matchStadium, matchReferee: String
    let teamHomeBadge, teamAwayBadge: String
    let leagueLogo, countryLogo: String
    let leagueYear, fkStageKey, stageName: String
    let goalscorer: [Goalscorer]
    let cards: [CardElement]
    let substitutions: Substitutions
    let lineup: Lineup
    let statistics, statistics1Half: [Statistic]

    enum CodingKeys: String, CodingKey {
        case matchID = "match_id"
        case countryID = "country_id"
        case countryName = "country_name"
        case leagueID = "league_id"
        case leagueName = "league_name"
        case matchDate = "match_date"
        case matchStatus = "match_status"
        case matchTime = "match_time"
        case matchHometeamID = "match_hometeam_id"
        case matchHometeamName = "match_hometeam_name"
        case matchHometeamScore = "match_hometeam_score"
        case matchAwayteamName = "match_awayteam_name"
        case matchAwayteamID = "match_awayteam_id"
        case matchAwayteamScore = "match_awayteam_score"
        case matchHometeamHalftimeScore = "match_hometeam_halftime_score"
        case matchAwayteamHalftimeScore = "match_awayteam_halftime_score"
        case matchHometeamExtraScore = "match_hometeam_extra_score"
        case matchAwayteamExtraScore = "match_awayteam_extra_score"
        case matchHometeamPenaltyScore = "match_hometeam_penalty_score"
        case matchAwayteamPenaltyScore = "match_awayteam_penalty_score"
        case matchHometeamFtScore = "match_hometeam_ft_score"
        case matchAwayteamFtScore = "match_awayteam_ft_score"
        case matchHometeamSystem = "match_hometeam_system"
        case matchAwayteamSystem = "match_awayteam_system"
        case matchLive = "match_live"
        case matchRound = "match_round"
        case matchStadium = "match_stadium"
        case matchReferee = "match_referee"
        case teamHomeBadge = "team_home_badge"
        case teamAwayBadge = "team_away_badge"
        case leagueLogo = "league_logo"
        case countryLogo = "country_logo"
        case leagueYear = "league_year"
        case fkStageKey = "fk_stage_key"
        case stageName = "stage_name"
        case goalscorer, cards, substitutions, lineup, statistics
        case statistics1Half = "statistics_1half"
    }
}

// MARK: - CardElement
struct CardElement: Codable {
    let time, homeFault: String
    let card: CardEnum
    let awayFault, info, homePlayerID, awayPlayerID: String
    let scoreInfoTime: ScoreInfoTime

    enum CodingKeys: String, CodingKey {
        case time
        case homeFault = "home_fault"
        case card
        case awayFault = "away_fault"
        case info
        case homePlayerID = "home_player_id"
        case awayPlayerID = "away_player_id"
        case scoreInfoTime = "score_info_time"
    }
}

enum CardEnum: String, Codable {
    case redCard = "red card"
    case yellowCard = "yellow card"
}

enum ScoreInfoTime: String, Codable {
    case the1StHalf = "1st Half"
    case the2NdHalf = "2nd Half"
}

// MARK: - Goalscorer
struct Goalscorer: Codable {
    let time, homeScorer, homeScorerID, homeAssist: String
    let homeAssistID, score, awayScorer, awayScorerID: String
    let awayAssist, awayAssistID, info: String
    let scoreInfoTime: ScoreInfoTime

    enum CodingKeys: String, CodingKey {
        case time
        case homeScorer = "home_scorer"
        case homeScorerID = "home_scorer_id"
        case homeAssist = "home_assist"
        case homeAssistID = "home_assist_id"
        case score
        case awayScorer = "away_scorer"
        case awayScorerID = "away_scorer_id"
        case awayAssist = "away_assist"
        case awayAssistID = "away_assist_id"
        case info
        case scoreInfoTime = "score_info_time"
    }
}

// MARK: - Lineup
struct Lineup: Codable {
    let home, away: LineupAway
}

// MARK: - LineupAway
struct LineupAway: Codable {
    let startingLineups, substitutes, coach: [Coach]
    let missingPlayers: [String]

    enum CodingKeys: String, CodingKey {
        case startingLineups = "starting_lineups"
        case substitutes, coach
        case missingPlayers = "missing_players"
    }
}

// MARK: - Coach
struct Coach: Codable {
    let lineupPlayer, lineupNumber, lineupPosition, playerKey: String

    enum CodingKeys: String, CodingKey {
        case lineupPlayer = "lineup_player"
        case lineupNumber = "lineup_number"
        case lineupPosition = "lineup_position"
        case playerKey = "player_key"
    }
}

// MARK: - Statistic
struct Statistic: Codable {
    let type, home, away: String
}

// MARK: - Substitutions
struct Substitutions: Codable {
    let home, away: [AwayElement]
}

// MARK: - AwayElement
struct AwayElement: Codable {
    let time, substitution, substitutionPlayerID: String

    enum CodingKeys: String, CodingKey {
        case time, substitution
        case substitutionPlayerID = "substitution_player_id"
    }
}

typealias Fixtures = [FixturesModel]
