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
    "APIkey=077fdb492de2977b79873a62d5738ed246bc1519da1d5cdfd175e2b6445029fd"
    
    static let topScorers =
    "https://apiv3.apifootball.com/" +
    "?action=get_topscorers&league_id=152&" +
    "APIkey=6f272244c8ec25329b4c524bf4a60f6ee13a7881fade63ec99acda4ca0437d5f"
    
    static let gameFixtures =
    "https://apiv3.apifootball.com/?action=get_events&from=2024-05-04&to=2024-05-19&league_id=152&" +
    "APIkey=077fdb492de2977b79873a62d5738ed246bc1519da1d5cdfd175e2b6445029fd"
}

struct TableViewIdentifiers {
    
    static let customCellIdentifier = "HomeScreenTableViewCell"
    static let headerViewIdentifier = "HomeScreenHeaderView"
    static let fixtureTableIdentifier = "FixturesScreenTableViewCell"
}

struct MonthConverter {
    
    static let matchDateMonths = ["January", "February", "March", 
                                  "April", "May", "June", "July", "August",
                                  "September", "October", "November", "December"]
}

struct SegueIdentifiers {
    
    static let loginSegueIdentifier = "HomeScreenSegue"
}
