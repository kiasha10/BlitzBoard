//
//  FixturesRepository.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/04/11.
//

import Foundation

typealias FixturesResult = (Result<Fixtures, APIError>)

protocol FixturesRepositoryType: AnyObject {
    func fetchFixtures(completion: @escaping(FixturesResult) -> Void)
}

class FixturesRepository: FixturesRepositoryType {
    private let apiHandler = APIHandler()
    func fetchFixtures(completion: @escaping (FixturesResult) -> Void) {
        apiHandler.request(endpoint: EndPoint.gameFixtures, method: "GET", completion: completion)
    }
}
