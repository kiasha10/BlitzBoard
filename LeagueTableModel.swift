//
//  LeagueTableModel.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/04/03.
//

import Foundation

// MARK: - WelcomeElement
struct LeagueTableModel: Codable {
    let countryName: CountryName
    let leagueID: String
    let leagueName: LeagueName
    let teamID, teamName: String
    let overallPromotion: OverallPromotion
    let overallLeaguePosition, overallLeaguePayed, overallLeagueW, overallLeagueD: String
    let overallLeagueL, overallLeagueGF, overallLeagueGA, overallLeaguePTS: String
    let homeLeaguePosition, homePromotion, homeLeaguePayed, homeLeagueW: String
    let homeLeagueD, homeLeagueL, homeLeagueGF, homeLeagueGA: String
    let homeLeaguePTS, awayLeaguePosition, awayPromotion, awayLeaguePayed: String
    let awayLeagueW, awayLeagueD, awayLeagueL, awayLeagueGF: String
    let awayLeagueGA, awayLeaguePTS, leagueRound: String
    let teamBadge: String
    let fkStageKey: String
    let stageName: StageName

    enum CodingKeys: String, CodingKey {
        case countryName = "country_name"
        case leagueID = "league_id"
        case leagueName = "league_name"
        case teamID = "team_id"
        case teamName = "team_name"
        case overallPromotion = "overall_promotion"
        case overallLeaguePosition = "overall_league_position"
        case overallLeaguePayed = "overall_league_payed"
        case overallLeagueW = "overall_league_W"
        case overallLeagueD = "overall_league_D"
        case overallLeagueL = "overall_league_L"
        case overallLeagueGF = "overall_league_GF"
        case overallLeagueGA = "overall_league_GA"
        case overallLeaguePTS = "overall_league_PTS"
        case homeLeaguePosition = "home_league_position"
        case homePromotion = "home_promotion"
        case homeLeaguePayed = "home_league_payed"
        case homeLeagueW = "home_league_W"
        case homeLeagueD = "home_league_D"
        case homeLeagueL = "home_league_L"
        case homeLeagueGF = "home_league_GF"
        case homeLeagueGA = "home_league_GA"
        case homeLeaguePTS = "home_league_PTS"
        case awayLeaguePosition = "away_league_position"
        case awayPromotion = "away_promotion"
        case awayLeaguePayed = "away_league_payed"
        case awayLeagueW = "away_league_W"
        case awayLeagueD = "away_league_D"
        case awayLeagueL = "away_league_L"
        case awayLeagueGF = "away_league_GF"
        case awayLeagueGA = "away_league_GA"
        case awayLeaguePTS = "away_league_PTS"
        case leagueRound = "league_round"
        case teamBadge = "team_badge"
        case fkStageKey = "fk_stage_key"
        case stageName = "stage_name"
    }
}

enum CountryName: String, Codable {
    case england = "England"
}

enum LeagueName: String, Codable {
    case premierLeague = "Premier League"
}

enum OverallPromotion: String, Codable {
    case empty = ""
    case promotionChampionsLeagueGroupStage = "Promotion - Champions League (Group Stage: )"
    case promotionEuropaLeagueGroupStage = "Promotion - Europa League (Group Stage: )"
    case relegationChampionship = "Relegation - Championship"
}

enum stageName: String, Codable {
    case current = "Current"
}

typealias LeagueTable = [LeagueTableModel]
