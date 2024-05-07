// LeagueTableRepository.swift
// BlitzBoard
//
// Created by Kiasha Rangasamy on 2024/04/11.

import Foundation

// MARK: Typealias
typealias HomeScreenResult = (Result<[HomeScreenModel], APIError>) -> Void

// MARK: LeagueTableRepository Protocol
protocol HomeScreenRepositoryType: AnyObject {
    
    func fetchLeagueTableResults(completion: @escaping(HomeScreenResult))
}

// MARK: Classes
class HomeScreenRepository: HomeScreenRepositoryType {
    
    private let apiHandler = APIHandler()
    
    func fetchLeagueTableResults(completion: @escaping (HomeScreenResult)) {
        apiHandler.request(endpoint: EndPoint.leagueTableEndpoint, method: "GET", completion: completion)
    }
}
