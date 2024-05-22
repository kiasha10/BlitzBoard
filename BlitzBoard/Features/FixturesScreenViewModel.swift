//  FixturesScreenViewModel.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/05/19.
//

import Foundation

class FixturesScreenViewModel {
    
    // MARK: Variables
    
    var fixtures: [FixturesModel]
    private let repository: FixturesRepositoryType
    private weak var delegate: ViewModelDelegate?
    
    init(repository: FixturesRepositoryType, delegate: ViewModelDelegate) {
        self.repository = repository
        self.delegate = delegate
        self.fixtures = []
        
    }
    
    // MARK: Computed Properties
    
    var fetchNumberOfGames: Int {
        fixtures.count
    }
    
    // MARK: Functions
    
    func matchDate(result: String) -> DateComponents {
        DateFormatter().customDateFormatter(date: "matchDate")
    }
    
    func fetchFixtures(at index: Int) -> FixturesModel {
        fixtures[index]
    }
    
    func fetchFixtures() {
        repository.fetchFixtures {[weak self] result in
            switch result {
            case .success(let fetchedFixtures):
                self?.fixtures = fetchedFixtures
                self?.delegate?.reloadView()
                print("Todays Fixtures are: \(String(describing: self?.fixtures))")
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
