//
//  TopScorersScreenViewModel.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/06/26.
//


import Foundation

class TopScorerViewModel {
    private let repository: TopScorersRepositoryType
    var didUpdateData: (() -> Void)?
    var topScorers: [PlayerModel] = []
    var error: APIError?
    var player: [PlayerModel]?
    var scorers: [PlayerModel] = [] {
        didSet {
            didUpdateData?()
        }
    }
    init(repository: TopScorersRepositoryType = TopScorersRepository()) {
        self.repository = repository
    }
    func fetchTopScorers() {
        repository.fetchTopScorers { [weak self] result in
            switch result {
            case .success(let players):
                // Handle successful retrieval of players
                self?.player = players
                print("Top Scorers: \(String(describing: self?.player?[14].playerName))")
            case .failure(let error):
                // Handle error
                print("Error: \(error)")
            }
        }
    }
}







