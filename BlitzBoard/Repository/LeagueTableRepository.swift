//
//  LeagueTableRepository.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/04/11.
//

import Foundation

typealias LeagueTableResult = (Result<[LeagueTableModel], APIError>)

protocol LeagueTableRepositoryType {
    func fetchLeagueTableResults(completion: @escaping(LeagueTableResult) -> Void)
}

class LeagueTableRepository: LeagueTableRepositoryType {
    
    private let apiHandler = APIHandler()
    
    func fetchLeagueTableResults(completion: @escaping (LeagueTableResult) -> Void) {
        apiHandler.request(endpoint: EndPoint.leagueTableEndpoint, method: "GET", completion: completion)
    }
}
