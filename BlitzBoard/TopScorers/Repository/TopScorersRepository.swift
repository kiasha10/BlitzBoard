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
        apiHandler.request(endpoint:
        "https://apiv3.apifootball.com/" +
        "?action=get_events&from=2024-04-20&to=2024-04-30&league_id=152&" +
        "APIkey=afd5a1ede5598029ca62b14f758edd87481d42c83fecb45afb8fa613c50efb7c",
        method: "GET",
        completion: completion)
    }
}
