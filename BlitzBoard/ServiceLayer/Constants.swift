//
// Constants.swift
// BlitzBoard
//
// Created by Kiasha Rangasamy on 2024/04/11.
//
import Foundation

struct EndPoint {
    
    static let leagueTableEndpoint =
    "https://apiv3.apifootball.com/" +
    "?action=get_standings&league_id=152&" +

    "APIkey=d842804c1b06016d9030ba43942f5169c29bf74941e67047f05d1c2a98b6241a"

    
    static let topScorers =
    "https://apiv3.apifootball.com/" +
    "?action=get_topscorers&league_id=152&" +
    "APIkey=d842804c1b06016d9030ba43942f5169c29bf74941e67047f05d1c2a98b6241a"
    
    static let gameFixtures =

    "https://apiv3.apifootball.com/?action=get_events&from=2024-05-19&to=2024-05-20&league_id=152&" +
    "APIkey=d842804c1b06016d9030ba43942f5169c29bf74941e67047f05d1c2a98b6241a"

}

struct TableViewIdentifiers {
    
    static let customCellIdentifier = "HomeScreenTableViewCell"
    static let headerViewIdentifier = "HomeScreenHeaderView"
    static let fixtureTableIdentifier = "FixturesScreenTableViewCell"
    static let topScorersTableIdentifier = "TopScorersScreenTableViewCell"
    static let topScorersHeaderIdentifier = "TopScorersHeaderView"
    
}

struct MonthConverter {
    
    static let matchDateMonths = ["January", "February", "March", 
                                  "April", "May", "June", "July", "August",
                                  "September", "October", "November", "December"]
}

struct SegueIdentifiers {
    
    static let loginSegueIdentifier = "HomeScreenSegue"
}
