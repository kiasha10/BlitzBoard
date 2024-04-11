//
//  TopScorerModel.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/04/03.
//

import Foundation

struct PlayerModel: Codable {
    // Define properties of PlayerModel
    let playerPlace, playerName: String
    let playerKey: Int
    let teamName, teamKey, goals, assists: String
    let penaltyGoals, fkStageKey: String
    let stageName: StageName

    enum CodingKeys: String, CodingKey {
        case playerPlace = "player_place"
        case playerName = "player_name"
        case playerKey = "player_key"
        case teamName = "team_name"
        case teamKey = "team_key"
        case goals, assists
        case penaltyGoals = "penalty_goals"
        case fkStageKey = "fk_stage_key"
        case stageName = "stage_name"
    }
}

enum StageName: String, Codable {
    case current = "Current"
}

typealias Welcome = [PlayerModel]

