//
//  LeagueTableModel.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/04/11.
//

import Foundation

// MARK: - League Table Model
struct LeagueTableModel: Codable {
    var countryName: CountryName
    var leagueID: String
    var leagueName: LeagueName
    var teamID, teamName: String
    var overallPromotion: String
    var overallLeaguePosition, overallLeaguePayed, overallLeagueW, overallLeagueD: String
    var overallLeagueL, overallLeagueGF, overallLeagueGA, overallLeaguePTS: String
    var homeLeaguePosition, homeLeaguePayed, homeLeagueW, homeLeagueD: String
    var homeLeagueL, homeLeagueGF, homeLeagueGA, homeLeaguePTS: String
    var homePromotion: String
    var leagueRound: String
    var awayPromotion: String
    var awayLeaguePosition, awayLeaguePayed, awayLeagueW, awayLeagueD: String
    var awayLeagueL, awayLeagueGF, awayLeagueGA, awayLeaguePTS: String
    var teamBadge: String
    var fkStageKey: String
    var stageName: StageNames
    
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
    case teamBadge = "team_badge"
    }
}
// MARK: - Enums with Unknown Case for Flexible Decoding
enum CountryName: String, Codable {
    case england = "England"
    case unknown
    init(from decoder: Decoder) throws {
        self = try CountryName(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }
}
enum LeagueName: String, Codable {
    case premierLeague = "Premier League"
    case unknown
    init(from decoder: Decoder) throws {
        self = try LeagueName(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }
}
enum StageNames: String, Codable {
    case current = "Current"
    case unknown
    init(from decoder: Decoder) throws {
        self = try StageNames(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }
}
typealias LeagueTable = [LeagueTableModel]
