//
//  CounterpartyData.swift
//  SearchCounterparty
//
//  Created by Самир Джафари on 15.11.2023.
//

import Foundation

struct CounterpartyData: CustomStringConvertible {
    let inn: String
    let kpp: String?
    let ogrn: String?
    let ownership: Ownership
    
    var description: String {
        let kpp = kpp ?? "Нет"
        let ogrn = ogrn ?? "Нет"
        
        return """
        ИНН: \(inn)\n
        КПП: \(kpp)\n
        ОГРН: \(ogrn)\n
        """
    }
}

extension CounterpartyData: Decodable {
    enum CodingKeys: String, CodingKey {
        case inn = "inn"
        case kpp = "kpp"
        case ogrn = "ogrn"
        case ownership = "type"
    }
}
