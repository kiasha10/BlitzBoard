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
    "APIkey=afd5a1ede5598029ca62b14f758edd87481d42c83fecb45afb8fa613c50efb7c"
    
    static let topScorers =
    "https://apiv3.apifootball.com/" +
    "?action=get_topscorers&league_id=152&" +
    "APIkey=6f272244c8ec25329b4c524bf4a60f6ee13a7881fade63ec99acda4ca0437d5f"
    
    static let gameFixtures =
    "https://apiv3.apifootball.com/?action=get_events&from=2024-05-19&to=2024-05-20&league_id=152&" +
    "APIkey=74b020fc0a9030ec2a6c0306d1db570ceacebbef52143f3185e22732224c0bc9"
}

struct TableViewIdentifiers {
    
    static let customCellIdentifier = "HomeScreenTableViewCell"
    static let headerViewIdentifier = "HomeScreenHeaderView"
    static let fixtureTableIdentifier = "FixturesTableView"
}
