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
}

// MARK: - Decodable
extension Counterparty: Decodable {
    enum CodingKeys: String, CodingKey {
        case name = "value"
        case data = "data"
    }
}
