//
//  CryptoCurrency.swift
//  CryptoCurrencySwiftUI
//
//  Created by Oğuzhan Gümüş on 10.02.2024.
//
// CodingKey , Hashable, identifiable, Decodable
import Foundation

struct CryptoCurrency : Decodable , Identifiable, Hashable {
    var id = UUID()
    let currency : String
    let price : String
    
    // Created this section cause the json file does not have id value
    private enum CodingKeys : String, CodingKey {
        case currency = "currency"
        case price = "price"
    }
}
