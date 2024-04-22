//
//  LeagueTableModel.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/04/11.
//

import Foundation


struct LeagueTableModel: Codable {
    var leagueName: LeagueName
    var teamName: String
    var overallLeaguePosition: String
    var overallLeagueW: String
    var overallLeagueD: String
    var overallLeagueL: String
    var teamBadge: String

enum CodingKeys: String, CodingKey {
    case leagueName = "league_name"
    case teamName = "team_name"
    case overallLeaguePosition = "overall_league_position"
    case overallLeagueW = "overall_league_W"
    case overallLeagueD = "overall_league_D"
    case overallLeagueL = "overall_league_L"
    case teamBadge = "team_badge"
    }
}

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
