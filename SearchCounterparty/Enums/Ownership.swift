//
//  Ownership.swift
//  SearchCounterparty
//
//  Created by Самир Джафари on 15.11.2023.
//

import Foundation

enum Ownership: String, Decodable {
    case legal = "LEGAL"
    case individual = "INDIVIDUAL"
    
    func getTitle() -> String {
        switch self {
        case .legal:
            "Юр. лицо"
        case .individual:
            "ИП"
        }
    }
}
