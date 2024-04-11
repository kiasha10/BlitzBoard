//
//  LeagueTableViewModel.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/04/03.
//

import Foundation


class LeagueTableViewModel {
    private let repository: LeagueTableRepositoryType
    
    var leagueTable: LeagueTable = []
    var error: APIError?
    
    init(repository: LeagueTableRepositoryType = LeagueTableRepository()) {
        self.repository = repository
    }
    
    func fetchLeagueTable() {
        repository.fetchLeagueTable { [weak self] result in
            switch result {
            case .success(let fetchedLeagueTable):
                self?.leagueTable = fetchedLeagueTable
                print("Fetched league table: \(self?.leagueTable)")
            case .failure(let error):
                // Handle Error
                print("Error: \(error)")
            }
        }
    }
}
