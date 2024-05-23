//  FixturesScreenRepository.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/05/19.
//

import Foundation

    // MARK: Typealias

typealias FixturesResult = (Result<[FixturesModel], APIError>) -> Void

    // MARK: Protocol

protocol FixturesRepositoryType: AnyObject {
    func fetchFixtures(completion: @escaping(FixturesResult) -> Void)
}

class FixturesScreenRepository: FixturesRepositoryType {
    
    // MARK: Variables
    
    private let apiHandler = APIHandler()
    
    // MARK: Functions
    
    func fetchFixtures(completion: @escaping (FixturesResult) -> Void) {
        apiHandler.request(endpoint: EndPoint.gameFixtures, method: "GET", completion: completion)
    }
}
