//
//  APIHandler.swift
//  BlitzBoard
//
//  Created by Kiasha Rangasamy on 2024/04/11.
//


import Foundation

enum CustomError: Error{
    case invalidResponse
    case invalidRequest
    case invalidUrl
    case invalidData
}

class APIHandler {

 func request<T: Codable>(endpoint: String, method: String, completion: @escaping ((Result<T, APIError>) -> Void)) {
    guard let url = URL(string: endpoint) else {
        completion(.failure(.internalError))
        return
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = method
    request.allHTTPHeaderFields = ["Content-Type": "application/json"]
    call(with: request, completion: completion)
}
    
    private func call<T: Codable>(with request: URLRequest, completion: @escaping ((Result<T, APIError>) -> Void)) {
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                DispatchQueue.main.async {
                    completion(.failure(.serverError))
                }
                return
            }
            do {
                guard let data = data else {
                    DispatchQueue.main.async {
                        completion(.failure(.serverError))
                    }
                    return
                }
                let object = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(object))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(.parsingError))
                }
            }
        }
        dataTask.resume()
    }
}