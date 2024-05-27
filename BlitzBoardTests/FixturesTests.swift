//  FixturesTests.swift
//  BlitzBoardTests
//
//  Created by Kiasha Rangasamy on 2024/05/27.
//

import XCTest
@testable import BlitzBoard

// MARK: - Mock Repository

class MockFixturesRepository: FixturesRepositoryType {
    var shouldReturnError = false
    var fixtures: [FixturesModel] = []
    
    func fetchFixtures(completion: @escaping FixturesResult) {
        if shouldReturnError {
            completion(.failure(.serverError))
        } else {
            completion(.success(fixtures))
        }
    }
}

// MARK: - Mock Delegate

class MockViewModelDelegate: ViewModelDelegate {
    func show(error: String) {
    }
    
    var reloadViewCalled = false
    
    func reloadView() {
        reloadViewCalled = true
    }
}

// MARK: - Test Case

class FixturesScreenViewModelTests: XCTestCase {
    var mockRepository: MockFixturesRepository!
    var mockDelegate: MockViewModelDelegate!
    var viewModel: FixturesScreenViewModel!
    
    override func setUp() {
        super.setUp()
        mockRepository = MockFixturesRepository()
        mockDelegate = MockViewModelDelegate()
        viewModel = FixturesScreenViewModel(repository: mockRepository, delegate: mockDelegate)
    }
    
    override func tearDown() {
        mockRepository = nil
        mockDelegate = nil
        viewModel = nil
        super.tearDown()
    }
    
    func testFetchFixturesSuccess() {
        let fixture = FixturesModel(matchDate: "2024-05-27",
                                    matchTime: "20:00",
                                    matchHometeamName: "Team A",
                                    matchAwayteamName: "Team B",
                                    matchStadium: "Stadium",
                                    teamHomeBadge: "homeBadge",
                                    teamAwayBadge: "awayBadge")
        mockRepository.fixtures = [fixture]
        
        viewModel.fetchFixtures()
        
        XCTAssertEqual(viewModel.fixtures.count, 1)
        XCTAssertEqual(viewModel.fixtures[0].matchHometeamName, "Team A")
        XCTAssertTrue(mockDelegate.reloadViewCalled)
    }
    
    func testFetchFixturesFailure() {
        
        mockRepository.shouldReturnError = true
        
        viewModel.fetchFixtures()
        
        XCTAssertTrue(viewModel.fixtures.isEmpty)
        XCTAssertFalse(mockDelegate.reloadViewCalled)
    }
    
    func testNumberOfGames() {

            let fixture1 = FixturesModel(matchDate: "2024-05-27", 
                                         matchTime: "20:00",
                                         matchHometeamName: "Team A",
                                         matchAwayteamName: "Team B",
                                         matchStadium: "Stadium",
                                         teamHomeBadge: "homeBadge",
                                         teamAwayBadge: "awayBadge")
            let fixture2 = FixturesModel(matchDate: "2024-05-28", 
                                         matchTime: "21:00",
                                         matchHometeamName: "Team C",
                                         matchAwayteamName: "Team D",
                                         matchStadium: "Another Stadium",
                                         teamHomeBadge: "homeBadge2",
                                         teamAwayBadge: "awayBadge2")
            viewModel.fixtures = [fixture1, fixture2]

            let numberOfGames = viewModel.numberOfGames

            XCTAssertEqual(numberOfGames, 2)
        }
    
    func testFixturesAtIndex() {

            let fixture1 = FixturesModel(matchDate: "2024-05-27", 
                                         matchTime: "20:00",
                                         matchHometeamName: "Team A",
                                         matchAwayteamName: "Team B",
                                         matchStadium: "Stadium",
                                         teamHomeBadge: "homeBadge",
                                         teamAwayBadge: "awayBadge")
            let fixture2 = FixturesModel(matchDate: "2024-05-28", 
                                         matchTime: "21:00",
                                         matchHometeamName: "Team C",
                                         matchAwayteamName: "Team D",
                                         matchStadium: "Another Stadium",
                                         teamHomeBadge: "homeBadge2",
                                         teamAwayBadge: "awayBadge2")
            viewModel.fixtures = [fixture1, fixture2]

            let fixture = viewModel.fixtures(atIndex: 1)

            XCTAssertEqual(fixture.matchHometeamName, "Team C")
            XCTAssertEqual(fixture.matchAwayteamName, "Team D")
        }
}
