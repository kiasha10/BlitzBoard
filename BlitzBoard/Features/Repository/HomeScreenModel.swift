// HomeScreenModel.swift
// BlitzBoard
//
// Created by Kiasha Rangasamy on 2024/04/11.

import Foundation

// MARK: LeagueTable Structs

struct LeagueTableModel: Codable {
    var leagueName: LeagueName
    var teamName: String
    var overallLeaguePosition: String
    var overallLeagueWin: String
    var overallLeagueDraw: String
    var overallLeagueLoss: String
    var teamBadge: String
    
    enum CodingKeys: String, CodingKey {
        case leagueName = "league_name"
        case teamName = "team_name"
        case overallLeaguePosition = "overall_league_position"
        case overallLeagueWin = "overall_league_Win"
        case overallLeagueDraw = "overall_league_Draw"
        case overallLeagueLoss = "overall_league_Loss"
        case teamBadge = "team_badge"
    }
}

// MARK: Enums

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
