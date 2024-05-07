// LeagueTableRepository.swift
// BlitzBoard
//
// Created by Kiasha Rangasamy on 2024/04/11.

import Foundation

// MARK: Typealias
typealias LeagueTableResult = (Result<[LeagueTableModel], APIError>) -> Void

// MARK: LeagueTableRepository Protocol
protocol LeagueTableRepositoryType: AnyObject {
    
    func fetchLeagueTableResults(completion: @escaping(LeagueTableResult))
}

// MARK: Classes
class LeagueTableRepository: LeagueTableRepositoryType {
    
    private let apiHandler = APIHandler()
    
    func fetchLeagueTableResults(completion: @escaping (LeagueTableResult)) {
        apiHandler.request(endpoint: "https://apiv3.apifootball.com/" +
                           "?action=get_standings&league_id=152&" 
                           + "APIkey=afd5a1ede5598029ca62b14f758edd87481d42c83fecb45afb8fa613c50efb7c",
                           method: "GET",
                           completion: completion)
    }
}
