//
//  GetCounterparties.swift
//  SearchCounterparty
//
//  Created by Самир Джафари on 15.11.2023.
//

import Foundation

struct DadataRestModel {
    var suggestions: [Counterparty]? = nil
}

// MARK: - Decodable

extension DadataRestModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case suggestions = "suggestions"
    }
}
