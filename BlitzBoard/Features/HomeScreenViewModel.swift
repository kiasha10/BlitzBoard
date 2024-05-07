// LeagueTableViewModel.swift
// BlitzBoard
//
// Created by Kiasha Rangasamy on 2024/04/11.
//

import Foundation

// MARK: ViewModel Delegate

protocol ViewModelDelegate: AnyObject {
    
    func reloadView()
    func show(error: String)
}

// MARK: ViewModel Class
class LeagueTableViewModel {
    
    private let repository: HomeScreenRepositoryType
    private weak var delegate: ViewModelDelegate?
    var leagueTables: [HomeScreenModel] = []
    
    // MARK: Initializing
    init(repository: HomeScreenRepositoryType, delegate: ViewModelDelegate) {
        self.repository = repository
        self.delegate = delegate
        self.leagueTables = []
    }
    
    // MARK: Functions
    func fetchLeagueTable() {
        repository.fetchLeagueTableResults { [weak self] result in
            switch result {
            case .success(let positions):
                self?.leagueTables = positions
                self?.delegate?.reloadView()
                print("Here are the stats: \(String(describing: self?.leagueTables))")
            case .failure(let error):
                self?.delegate?.show(error: error.rawValue)
            }
        }
    }
    
    // MARK: Computed Properties
    var fetchNumberOfTeams: Int {
        leagueTables.count
    }
    
    func fetchTeam(at index: Int) -> HomeScreenModel? {
        leagueTables[index]
    }
}
