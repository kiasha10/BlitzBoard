//  TopScorersScreenRepository.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/06/26.
//

import Foundation

    // MARK: Typealias

typealias TopScorerResult = (Result<[PlayerModel], APIError>) -> Void

    // MARK: Protocol

protocol TopScorersRepositoryType: AnyObject {
  func fetchTopScorers(completion: @escaping TopScorerResult)
}

class TopScorersRepository: TopScorersRepositoryType {
    
    // MARK: Variables 
    
  private let apiHandler = APIHandler()
    
    // MARK: Functions
    
    func fetchTopScorers(completion: @escaping TopScorerResult) {
        apiHandler.request(endpoint: EndPoint.topScorers, method: "GET", completion: completion)
    }
    func fetchTeamLogo(completion: @escaping TopScorerResult) {
        apiHandler.request(endpoint: EndPoint.leagueTableEndpoint, method: "GET", completion: completion)
    }
}
