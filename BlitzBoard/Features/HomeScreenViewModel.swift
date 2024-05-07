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
    
    private let repository: LeagueTableRepositoryType
    var leagueTables: [LeagueTableModel]
    private weak var delegate: ViewModelDelegate?
    
    // MARK: Initializing
    init(repository: LeagueTableRepositoryType, delegate: ViewModelDelegate) {
        self.repository = repository
        self.delegate = delegate
        self.leagueTables = []
    }
    
    // MARK: Method
    func fetchLeagueTable() {
        repository.fetchLeagueTableResults(completion: { [weak self] result in
            switch result {
            case .success(let positions):
                self?.leagueTables = positions
                self?.delegate?.reloadView()
                print("Here are the stats: \(String(describing: self?.leagueTables))")
            case .failure(let error):
                self?.delegate?.show(error: error.rawValue)
            }
        })
    }
    
    // MARK: Computed Properties
    var fetchNumberOfTeams: Int {
         leagueTables.count
    }
    
    var fetchTeam: Int {
        leagueTables.count
    }
}
