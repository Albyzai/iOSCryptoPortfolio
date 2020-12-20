//
//  Response.swift
//  CryptoPortfolio
//
//  Created by Jonas Pedersen on 19/12/2020.
//

import Foundation

struct Response<T: Codable>: Codable {
    let data: T
    let status: ResponseStatus
}

struct ResponseStatus: Codable {
    let timestamp: String?
    let error_code: Int?
    let error_message: String?
    let elapsed: Int?
    let credit_count: Int?
}

//struct CryptowatchResponse<T: Codable>: Codable {
//    let result: RandomID?
//    struct RandomID: Codable {
//        let values: [[Double]]?
//    }
//}

struct CryptowatchResponse<T: Codable>: Codable {
    let result: [T]
}

//struct CryptowatchResponse<T: Codable>: Decodable {
//    var result: RandomID?
//    struct RandomID: Decodable {
//        let values: [Double]
//    }
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        for key in container.allKeys {
//            result = try? container.decode(RandomID.self, forKey: key)
//        }
//        print(container.allKeys)
//    }
//    struct CodingKeys: CodingKey {
//        var stringValue: String
//        init?(stringValue: String) {
//            self.stringValue = stringValue
//        }
//        var intValue: Int?
//        init?(intValue: Int) {
//            return nil
//        }
//    }
//}
//
//extension CryptowatchResponse {
//
//}

struct CandleStickData: Decodable {
    let array: [Double]
    
}
struct CandleStickEntry: Codable {
    
    var closeTime: Double
    var openTime: Double
    var highPrice: Double
    var lowPrice: Double
    var closePrice: Double
    var volume: Double
    var quoteVolume: Double
    
}
