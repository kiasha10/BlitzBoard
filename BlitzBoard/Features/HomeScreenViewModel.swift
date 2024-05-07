// HomeScreenViewModel.swift
// BlitzBoard
//
// Created by Kiasha Rangasamy on 2024/04/11.
//

import Foundation

protocol ViewModelDelegate: AnyObject {
    func reloadView()
    func show(error: String)
}

class HomeScreenViewModel {
    
    // MARK: Variables
    
    var leagueTables: [LeagueTableModel] = []
    
    private let repository: HomeScreenRepositoryType
    private weak var delegate: ViewModelDelegate?
    
    init(repository: HomeScreenRepositoryType, delegate: ViewModelDelegate) {
        self.repository = repository
        self.delegate = delegate
        self.leagueTables = []
    }
    
    // MARK: Computed Properties
    
    var fetchNumberOfTeams: Int {
        leagueTables.count
    }
    // MARK: Functions
    
    func fetchTeam(at index: Int) -> LeagueTableModel? {
        leagueTables[index]
    }
    
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
}
