//  TopScorersScreenViewModel.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/06/26.
//

import Foundation

class TopScorerScreenViewModel {
    
    // MARK: Variables
    
    var topScorers: [PlayerModel]
    private let repository: TopScorersRepositoryType
    private weak var delegate: ViewModelDelegate?

    init(repository: TopScorersRepositoryType, delegate: ViewModelDelegate) {
        self.repository = repository
        self.delegate = delegate
        self.topScorers = []
    }
    
    // MARK: Computed Variables
    
    var numberOfPlayer: Int {
        topScorers.count
    }
    
    // MARK: Functions
    
    func topScorers(atIndex: Int) -> PlayerModel {
        topScorers[atIndex]
    }
    
    func fetchTopScorers() {
        repository.fetchTopScorers { [weak self] result in
            switch result {
            case .success(let fetchedPlayers):
                self?.topScorers = fetchedPlayers
                self?.delegate?.reloadView()
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
