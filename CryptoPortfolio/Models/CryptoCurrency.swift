//
//  CryptoCurrency.swift
//  CryptoPortfolio
//
//  Created by Jonas Pedersen on 19/12/2020.
//

import Foundation

//struct Quote: Codable {
//    let key: [Currency]?
//
////}
//extension Quote: CustomStringConvertible {
//    var description: String {
//        return "\(String(describing: key))"
//    }
//}
//struct Currency: Codable {
//    let price: Double?
//    let volume: Double?
//    let volume_24h: Double?
//    let volume_7d: Double?
//    let volume_30d: Double?
//    let percent_change_1h: Double?
//    let percent_change_24h: Double?
//    let percent_change_7d: Double?
//    let last_updated: String?
//}
//struct CryptoCurrency: Codable {
//    let id: Int?
//    let name: String?
//    let symbol: String?
//    let slug: String?
//    let cmc_rank: Int?
//    let num_market_pairs: Int?
//    let circulating_supply: Double?
//    let total_supply: Double?
//    let market_cap_by_total_supply: Double?
//    let max_supply: Double?
//    let last_updated: String?
//    let tags: [String]?
//    let platform: Platform?
//    let quote: Quote?
//}

struct Platform: Codable {
    let id: Int?
    let name: String?
    let symbol: String?
    let slug: String?
    let token_address: String?
}

extension Platform: CustomStringConvertible {
    var description: String {
        return  """
                id: \(String(describing: id))
                name: \(String(describing: name))
                symbol: \(String(describing: symbol))
                slug: \(String(describing: slug))
                token_address: \(String(describing: token_address))
                """
    }
}
//
//extension CryptoCurrency: CustomStringConvertible {
//    var description: String {
//        return  """
//                id: \(String(describing: id))
//                name: \(String(describing: name))
//                slug: \(String(describing: slug))
//                cmc_rank: \(String(describing: cmc_rank))
//                num_market_pairs: \(String(describing: num_market_pairs))
//                circulating_supply: \(String(describing: circulating_supply))
//                total_supply: \(String(describing: total_supply))
//                market_cap_by_total_supply: \(String(describing: market_cap_by_total_supply))
//                max_supply: \(String(describing: max_supply))
//                last_updated: \(String(describing: last_updated))
//                tags: \(String(describing: tags))!
//                platform: \(String(describing: platform))
//                quote: \(String(describing: quote))
//                """
//    }
//}

struct Market: Codable {
    let id: Int?
    let exchange: String?
    let pair: String?
    let active: Bool?
    let route: String?
}

struct Asset: Codable {
    let id: Int?
    let symbol: String?
    let name: String?
    let fiat: Bool?
    let route: String?
}
