// LeagueTableModel.swift
// BlitzBoard
//
// Created by Kiasha Rangasamy on 2024/04/11.

import Foundation

// MARK: LeagueTable Struct

struct LeagueTableModel: Codable {
    var leagueName: String
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
