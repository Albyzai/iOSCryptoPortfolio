import Foundation

//
//  Response.swift
//  CryptoPortfolio
//
//  Created by Jonas Pedersen on 19/12/2020.
//

import Foundation

public struct Response<T: Codable>: Codable {
    public let data: T
    public let status: ResponseStatus
}

public struct ResponseStatus: Codable {
    public let timestamp: String?
    public let error_code: Int?
    public let error_message: String?
    public let elapsed: Int?
    public let credit_count: Int?
}

//struct CryptowatchResponse<T: Codable>: Codable {
//    let result: RandomID?
//    struct RandomID: Codable {
//        let values: [[Double]]?
//    }
//}

