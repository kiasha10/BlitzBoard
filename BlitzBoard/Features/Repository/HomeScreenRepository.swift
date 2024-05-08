// HomeScreenRepository.swift
// BlitzBoard
//
// Created by Kiasha Rangasamy on 2024/04/11.

import Foundation

// MARK: Typealias

typealias LeagueTableResult = (Result<[LeagueTableModel], APIError>) -> Void

// MARK: HomeScreenRepository Protocol

protocol HomeScreenRepositoryType: AnyObject {
    func fetchLeagueTableResults(completion: @escaping LeagueTableResult )
}

class HomeScreenRepository: HomeScreenRepositoryType {
    
    private let apiHandler = APIHandler()
    
    func fetchLeagueTableResults(completion: @escaping LeagueTableResult) {
        apiHandler.request(endpoint: EndPoint.leagueTableEndpoint, method: "GET", completion: completion)
    }
}
