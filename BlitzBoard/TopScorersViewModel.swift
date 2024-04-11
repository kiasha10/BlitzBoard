//
//  TopScorersViewModel.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/04/11.
//

import Foundation

class TopScorerViewModel {
    private let repository: TopScorerRepositoryType
    
    var topScorers: [PlayerModel] = []
    var error: APIError?
    var player: [PlayerModel]?
    
    init(repository: TopScorerRepositoryType = TopScorerRepository()) {
        self.repository = repository
    }
    
    func fetchTopScorers() {
        repository.fetchSearchResults{[weak self] result in
            switch result {
            case .success(let players):
                // Handle successful retrieval of players
                self?.player=players
                print("Top Scorers: \(self?.player?[0].playerName)")
            case .failure(let error):
                // Handle error
                print("Error: \(error)")
            }
        }
        
    }
}
