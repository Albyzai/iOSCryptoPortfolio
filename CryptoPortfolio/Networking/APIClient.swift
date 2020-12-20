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

class APIClient {
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
            
            
            print("DATA: \(String(decoding: data, as: UTF8.self))")
            
            let result = Result(catching: {
                try decoder.decode(CryptowatchResponse<T>.self, from: data)
            })
            
            completion(result)
        }.resume()
        
    }
}

struct Resource {
    init(path: String) {
        self.path = path
    }
    let api: String = "https://sandbox-api.coinmarketcap.com"
    let path: String
    var url: URL {
        return URL(string: "\(api)\(path)")!
    }
    let method: String = "GET"
}

extension URLRequest {
    
    init(_ resource: Resource) {
        self.init(url: resource.url)
        self.httpMethod = resource.method
    }
    
}

struct AnyKey: CodingKey {
    var stringValue: String
    var intValue: Int?
    
    init?(stringValue: String) {
        self.stringValue = stringValue
        self.intValue = nil
    }
    
    init?(intValue: Int) {
        self.stringValue = String(intValue)
        self.intValue = intValue
    }
}
