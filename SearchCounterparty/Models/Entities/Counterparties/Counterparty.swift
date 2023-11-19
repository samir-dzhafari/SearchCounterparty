//
//  Counterparty.swift
//  SearchCounterparty
//
//  Created by Самир Джафари on 15.11.2023.
//

import Foundation

struct Counterparty {
    let name: String
    let data: CounterpartyData
    
    init(value: [String: Any]) {
        name = value["value"] as? String ?? ""
        
        let dictSpritest = value["data"] as? [String: Any] ?? [:]
        data = CounterpartyData(value: dictSpritest)
    }
    
    static func fromResponse(from response: Any) -> [Counterparty]? {
        guard let value = response as? [String: Any],
              let suggestions = value["suggestions"] as? [[String: Any]] else {
            return nil
        }
        
        return suggestions.compactMap { Counterparty(value: $0) }
    }
}

// MARK: - Decodable
extension Counterparty: Decodable {
    enum CodingKeys: String, CodingKey {
        case name = "value"
        case data = "data"
    }
}
