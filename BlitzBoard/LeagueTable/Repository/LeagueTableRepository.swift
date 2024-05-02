//
//  LeagueTableRepository.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/04/11.
//

import Foundation

typealias LeagueTableResult = (Result<[LeagueTableModel], APIError>) -> Void

protocol LeagueTableRepositoryType: AnyObject {
    func fetchLeagueTableResults(completion: @escaping(LeagueTableResult))
}

class LeagueTableRepository: LeagueTableRepositoryType {
    
    private let apiHandler = APIHandler()
    
    func fetchLeagueTableResults(completion: @escaping (LeagueTableResult)) {
        let url = EndPoint.leagueTableEndpoint
        apiHandler.request(endpoint: url, method: "GET", completion: completion)
    }
}
