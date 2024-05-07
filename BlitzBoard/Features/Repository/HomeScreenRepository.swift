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
        
        let url = EndPoint.leagueTableEndpoint
        apiHandler.request(endpoint: url, method: "GET", completion: completion)
    }
}