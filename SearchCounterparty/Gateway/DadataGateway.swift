//
//  DadataGateway.swift
//  SearchCounterparty
//
//  Created by Самир Джафари on 15.11.2023.
//

import Foundation

// Не доработал ошибки, не успел

enum DadataGatawayError: Error {
    case badRequest
    case decodeError
    case responseKeyInvalid
    case parametersInvalid
    case noData
}

typealias GetCounterpartiesResult = Result<[Counterparty], DadataGatawayError>

final class DadataGateway {
    
    static let shared = DadataGateway()
    
    private let token = "Token 567931aae14f94caa126e4946f9fcf803eabf968"
    
    private init() {}
    
    func getCounterparties(_ value: String, completion: @escaping(GetCounterpartiesResult) -> Void) {
        
        let request = getRequest(method: "POST", parameters: ["query": value])
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data)
                if let counterparties = Counterparty.fromResponse(from: json) {
                    completion(.success(counterparties))
                } else {
                    completion(.failure(.responseKeyInvalid))
                }
            } catch _ {
                completion(.failure(.decodeError))
            }
        }
        
        task.resume()
    }
    
    private func getRequest(method: String, parameters: [String: Any]? = nil) -> URLRequest {
        let url = URL(string: "https://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/party")!
        
        var request = URLRequest(url: url)
        
        request.httpMethod = method
        
        request.addValue(self.token, forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        if let parameters = parameters {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
            } catch {
                print("Ошибка при преобразовании параметров в JSON: \(error)")
            }
        }
        
        return request
    }
}
