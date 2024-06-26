//  TopScorersModel.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/06/26.
//

import Foundation

// MARK: Top Scorers Model

struct PlayerModel: Codable {
    let playerPlace: String
    let playerName: String
    let teamName: String
    let goals:String

  enum CodingKeys: String, CodingKey {
    case playerPlace = "player_place"
    case playerName = "player_name"
    case teamName = "team_name"
    case goals = "goals"
  }
}
