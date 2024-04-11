//
//  LeagueTableRepository.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/04/03.
//

import Foundation


typealias LeagueTableResult = (Result<[LeagueTableModel], APIError>) -> Void

protocol LeagueTableRepositoryType: AnyObject {
    func fetchSearchResults(completion: @escaping(LeagueTableResult))
}

class LeagueTableRepository: LeagueTableRepositoryType {
    
    private let apiHandler = APIHandler()
    
    func fetchLeagueTableResults(completion: @escaping (LeagueTableResult)) {
        apiHandler.request(endpoint: "https://apiv3.apifootball.com/?action=get_standings&league_id=152&APIkey=6f272244c8ec25329b4c524bf4a60f6ee13a7881fade63ec99acda4ca0437d5f", method: "GET", completion: completion)
    }
}
