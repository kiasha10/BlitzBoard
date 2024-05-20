//
//  FixturesScreenViewModel.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/05/19.
//

import Foundation

class FixturesScreenViewModel {
    
    private let repository: FixturesRepositoryType
    
    var fixtures: [FixturesScreenModel]
    private weak var delegate: ViewModelDelegate?
    
    init(repository: FixturesRepositoryType, delegate: ViewModelDelegate) {
        self.repository = repository
        self.delegate = delegate
        self.fixtures = []
    }
    
    var fetchNumberOfGames: Int {
        fixtures.count
    }
    
    func fetchFixtures(at index: Int) -> FixturesScreenModel {
        fixtures[index]
    }
    
    func fetchFixtures() {
        repository.fetchFixtures {[weak self] result in
            switch result {
            case .success(let fetchedFixtures):
                self?.fixtures = fetchedFixtures
                print("Todays Fixtures are: \(String(describing: self?.fixtures))")
            case .failure(let error):
                // Handle Error
                print("Error: \(error)")
            }
        }
    }
}
