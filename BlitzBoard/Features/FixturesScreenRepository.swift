//
//  FixturesScreenRepository.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/05/19.
//

import Foundation

// MARK: FixturesResult Typealias

typealias FixturesResult = (Result<[FixturesScreenModel], APIError>)

// MARK: FixturesScreenRepositpry Protocol

protocol FixturesRepositoryType: AnyObject {
    
  func fetchFixtures(completion: @escaping(FixturesResult) -> Void)
}

class FixturesScreenRepository: FixturesRepositoryType {
  private let apiHandler = APIHandler()
  func fetchFixtures(completion: @escaping (FixturesResult) -> Void) {
    apiHandler.request(endpoint: EndPoint.gameFixtures, method: "GET", completion: completion)
  }
}
