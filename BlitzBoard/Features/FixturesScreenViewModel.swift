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
    
    var numberOfGames: Int {
        fixtures.count
    }
    
    // MARK: Functions
    
    func matchDate(result: String, dateFormatter: DateFormatter = DateFormatter()) -> DateComponents {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        guard let date = dateFormatter.date(from: result) else {
            return DateComponents()
        }
        
        return Calendar.current.dateComponents([.year, .month, .day], from: date)
    }
    
    func fixtures(atIndex: Int) -> FixturesModel {
        fixtures[atIndex]
    }
    
    func fetchFixtures() {
        repository.fetchFixtures { [weak self] result in
            switch result {
            case .success(let fetchedFixtures):
                self?.fixtures = fetchedFixtures
                self?.delegate?.reloadView()
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
