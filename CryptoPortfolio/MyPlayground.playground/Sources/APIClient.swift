import Foundation

//
//  APIClient.swift
//  CryptoPortfolio
//
//  Created by Jonas Pedersen on 17/12/2020.
//

import Foundation

extension URLComponents {
    
    mutating func setQueryParams(with parameters: [String: String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}

public class APIClient {
    public static let shared: APIClient = APIClient()
    var session: URLSession
    
    init() {
        let config: URLSessionConfiguration = .default
        config.httpAdditionalHeaders = ["X-CMC_PRO_API_KEY": "0f9b4e50-73a9-4cdf-8fec-472b91f8e3cf"]
        self.session = URLSession(configuration: config)
    }
    
    func request<T: Codable>(_ resourcePath: String, params: [String: String] = [:], completion: @escaping ((Result<CryptowatchResponse<T>, Error>) -> Void))  {
        var urlComponents: URLComponents {
            var urlComponents = URLComponents()
            urlComponents.scheme = "https"
            urlComponents.host = "api.cryptowat.ch"
            urlComponents.path = resourcePath
            urlComponents.setQueryParams(with: params)
            return urlComponents
        }
        guard let url = urlComponents.url else {
            return
        }
        
        print("url: \(url)")
       
        let _: Void = session.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                    return
                }

                fatalError("Data and error should never both be nil")
            }
            
            let decoder =  JSONDecoder()
            
            
            
            let result = Result(catching: {
                try decoder.decode(CryptowatchResponse<T>.self, from: data)
            })
            
            completion(result)
        }.resume()
        
    }
}

public struct RandomID: Decodable {
    let values: [Double]
}

public struct CandleData: Codable {
    
}

public struct CryptowatchResponse<T: Codable>: Decodable {
    public var result: [[Double]]?
    
    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        result = try container.decode([[Double]].self)
    }
    
    
    // Define DynamicCodingKeys type needed for creating
    // decoding container from JSONDecoder
    private struct DynamicCodingKeys: CodingKey {

            // Use for string-keyed dictionary
            var stringValue: String
            init?(stringValue: String) {
                self.stringValue = stringValue
            }

            // Use for integer-keyed dictionary
            var intValue: Int?
            init?(intValue: Int) {
                // We are not using this, thus just return nil
                return nil
            }
        }
    
//    public init(from decoder: Decoder) throws {
//
//            // 1
//            // Create a decoding container using DynamicCodingKeys
//            // The container will contain all the JSON first level key
//            let container = try decoder.container(keyedBy: DynamicCodingKeys.self)
//
//            var tempArray = [RandomID]()
//
//            // 2
//            // Loop through each key (student ID) in container
//            for key in container.allKeys {
//
//                // Decode Student using key & keep decoded Student object in tempArray
//                let decodedObject = try container.decode(RandomID.self, forKey: DynamicCodingKeys(stringValue: key.stringValue)!)
//                tempArray.append(decodedObject)
//            }
//
//            // 3
//            // Finish decoding all Student objects. Thus assign tempArray to array.
//            result = tempArray
//        }
}

extension CryptowatchResponse {
    
}

public struct CandleStickData: Decodable {
    public let array: [Double]
    
}
public struct CandleStickEntry: Codable {
    
    public var closeTime: Double
    public var openTime: Double
    public var highPrice: Double
    public var lowPrice: Double
    public var closePrice: Double
    public var volume: Double
    public var quoteVolume: Double
    
}


public struct DecodedArray<T: Decodable>: Decodable {

    // ***
    typealias DecodedArrayType = [T]

    private var array: DecodedArrayType

    // Define DynamicCodingKeys type needed for creating decoding container from JSONDecoder
    private struct DynamicCodingKeys: CodingKey {

        // Use for string-keyed dictionary
        var stringValue: String
        init?(stringValue: String) {
            self.stringValue = stringValue
        }

        // Use for integer-keyed dictionary
        var intValue: Int?
        init?(intValue: Int) {
            // We are not using this, thus just return nil
            return nil
        }
    }

    public init(from decoder: Decoder) throws {

        // Create decoding container using DynamicCodingKeys
        // The container will contain all the JSON first level key
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var tempArray = DecodedArrayType()

        // Loop through each keys in container
        for key in container.allKeys {

            // ***
            // Decode T using key & keep decoded T object in tempArray
            let decodedObject = try container.decode(T.self, forKey: DynamicCodingKeys(stringValue: key.stringValue)!)
            tempArray.append(decodedObject)
        }

        // Finish decoding all T objects. Thus assign tempArray to array.
        array = tempArray
    }
}

