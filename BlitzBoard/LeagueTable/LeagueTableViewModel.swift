//
//  LeagueTableViewModel.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/04/11.
//

import Foundation

protocol ViewModelDelegate: AnyObject {
    func reloadView()
    func show(error: String)
}

class LeagueTableViewModel {
    private let repository: LeagueTableRepositoryType
    var leagueTables: [LeagueTableModel]
    private weak var delegate: ViewModelDelegate?
    init(repository: LeagueTableRepositoryType, delegate: ViewModelDelegate) {
        self.repository = repository
        self.delegate = delegate
        self.leagueTables = []
    }
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
    func getNumberOfTeams() -> Int {
        return leagueTables.count
    }
    func getTeam(at index: Int) -> LeagueTableModel? {
        return leagueTables[index]
    }
}
