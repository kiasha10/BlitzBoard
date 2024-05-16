// LeagueTableModel.swift
// BlitzBoard
//
// Created by Kiasha Rangasamy on 2024/04/11.

import Foundation

// MARK: LeagueTable Struct

struct LeagueTableModel: Codable {
    var teamName: String
    var overallLeaguePosition: String
    var overallLeagueWin: String
    var overallLeagueDraw: String
    var overallLeagueLoss: String
    var teamBadge: String
    
    enum CodingKeys: String, CodingKey {
        case teamName = "team_name"
        case overallLeaguePosition = "overall_league_position"
        case overallLeagueWin = "overall_league_W"
        case overallLeagueDraw = "overall_league_D"
        case overallLeagueLoss = "overall_league_L"
        case teamBadge = "team_badge"
    }
}
