//  HomeScreenTests.swift
//  BlitzBoardTests
//
//  Created by Kiasha Rangasamy on 2024/05/27.
//

import XCTest
@testable import BlitzBoard

// MARK: - Mock Classes

class MockRepository: HomeScreenRepositoryType {
    var shouldReturnError = false
    
    func fetchLeagueTableResults(completion: @escaping LeagueTableResult) {
        if shouldReturnError {
            completion(.failure(APIError.parsingError))
        } else {
            let mockData = [
                LeagueTableModel(teamName: "Team A",
                                 overallLeaguePosition: "1",
                                 overallLeagueWin: "10",
                                 overallLeagueDraw: "5",
                                 overallLeagueLoss: "0",
                                 teamBadge: "badge_a"),
                LeagueTableModel(teamName: "Team B", 
                                 overallLeaguePosition: "2",
                                 overallLeagueWin: "8",
                                 overallLeagueDraw: "6",
                                 overallLeagueLoss: "1",
                                 teamBadge: "badge_b")
            ]
            completion(.success(mockData))
        }
    }
}

class MockDelegate: ViewModelDelegate {
    var reloadViewCalled = false
    var showErrorCalled = false
    var errorMessage: String?

    func reloadView() {
        reloadViewCalled = true
    }
    
    func show(error: String) {
        showErrorCalled = true
        errorMessage = error
    }
}

// MARK: - ViewModel Tests

class HomeScreenViewModelTests: XCTestCase {

    var viewModel: HomeScreenViewModel!
    var mockRepository: MockRepository!
    var mockDelegate: MockDelegate!

    override func setUp() {
        super.setUp()
        mockRepository = MockRepository()
        mockDelegate = MockDelegate()
        viewModel = HomeScreenViewModel(repository: mockRepository, delegate: mockDelegate)
    }

    override func tearDown() {
        viewModel = nil
        mockRepository = nil
        mockDelegate = nil
        super.tearDown()
    }

    func testNumberOfTeams() {
        XCTAssertEqual(viewModel.numberOfTeams, 0)
        viewModel.leagueTables = [LeagueTableModel(teamName: "Team A", 
                                                   overallLeaguePosition: "1",
                                                   overallLeagueWin: "10",
                                                   overallLeagueDraw: "5",
                                                   overallLeagueLoss: "0",
                                                   teamBadge: "badge_a")]
        XCTAssertEqual(viewModel.numberOfTeams, 1)
    }

    func testFetchTeamAtIndex() {
        let team = LeagueTableModel(teamName: "Team A", 
                                    overallLeaguePosition: "1",
                                    overallLeagueWin: "10",
                                    overallLeagueDraw: "5",
                                    overallLeagueLoss: "0",
                                    teamBadge: "badge_a")
        viewModel.leagueTables = [team]
        let fetchedTeam = viewModel.fetchTeam(at: 0)
        XCTAssertEqual(fetchedTeam.teamName, team.teamName)
    }

    func testFetchLeagueTableSuccess() {
        viewModel.fetchLeagueTable()
        XCTAssertTrue(mockDelegate.reloadViewCalled)
        XCTAssertEqual(viewModel.numberOfTeams, 2)
        XCTAssertEqual(viewModel.leagueTables[0].teamName, "Team A")
    }

    func testFetchLeagueTableFailure() {
        mockRepository.shouldReturnError = true
        viewModel.fetchLeagueTable()
        XCTAssertTrue(mockDelegate.showErrorCalled)
        XCTAssertEqual(mockDelegate.errorMessage, APIError.parsingError.rawValue)
    }
}
