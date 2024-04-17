//
//  FixtureViewModel.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/04/11.
//

import Foundation



class FixturesViewModel {
    
    private let repository: FixturesRepositoryType
    var fixtures: Fixtures? = nil
    var error: APIError?
    
    
    init(repository: FixturesRepositoryType) {
        self.repository = repository
    }
    
    func fetchFixtures() {
        repository.fetchFixtures {[weak self] result in
            switch result {
            case .success(let fetchedFixtures):
                self?.fixtures = fetchedFixtures
                print("Todays Fixtures are: \(String(describing: self?.fixtures))")
            case .failure(let error):
                //Handle Error
                print("Error: \(error)")
            }
        }
    }
}

