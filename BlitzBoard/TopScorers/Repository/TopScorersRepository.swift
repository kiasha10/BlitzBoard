//
//  TopScorersRepository.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/04/11.
//

import Foundation

typealias TopScorerResult = (Result<[PlayerModel], APIError>) -> Void

protocol TopScorerRepositoryType: AnyObject {
    func fetchSearchResults(completion: @escaping(TopScorerResult))
}

class TopScorerRepository: TopScorerRepositoryType {
    
    private let apiHandler = APIHandler()
    
    func fetchSearchResults(completion: @escaping (TopScorerResult)) {
        apiHandler.request(endpoint: "https://apiv3.apifootball.com/?action=get_topscorers&league_id=152&APIkey=6f272244c8ec25329b4c524bf4a60f6ee13a7881fade63ec99acda4ca0437d5f", method: "GET", completion: completion)
    }
}
