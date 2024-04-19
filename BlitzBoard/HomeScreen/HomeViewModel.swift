//
//  HomeViewModel.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/04/14.
//

import Foundation


class FootballDataViewModel {
    // Sample data
    var standings: [String] = []
    var fixtures: [String] = ["Fixture 1", "Fixture 2", "Fixture 3", "Fixture 4", "Fixture 5"]
    var topScorers: [String] = ["Player 1", "Player 2", "Player 3", "Player 4", "Player 5"]
    
    func fetchStandings() -> [String] {

        return standings
    }
    
    func fetchFixtures() -> [String] {
        // Fetch fixtures data from API or database
        return fixtures
    }
    
    func fetchTopScorers() -> [String] {
        // Fetch top scorers data from API or database
        return topScorers
    }
}
