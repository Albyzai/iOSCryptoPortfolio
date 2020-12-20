//
//  CryptoService.swift
//  CryptoPortfolio
//
//  Created by Jonas Pedersen on 18/12/2020.
//

import Foundation

public final class Services {
    
//    class func latestListings(completion: @escaping(Result<Response<[CryptoCurrency]>, Error>) -> Void) {
//        let path: String = "/v1/cryptocurrency/listings/latest"
////        let resource: Resource = Resource(path: path)
//        APIClient.shared.request(path, completion: { result in
//            completion(result)
//        })
//    }
//
//    class func IDMap(completion: @escaping(Result<Response<[CryptoCurrency]>, Error>) -> Void) {
//        let path: String = "/v1/cryptocurrency/map"
////        let resource: Resource = Resource(path: path)
//        APIClient.shared.request(path, completion: { result in
//            completion(result)
//        })
//    }
    
    public class func fetchOHLCCandleStickData(completion: @escaping(Result<CryptowatchResponse<[Double]>, Error>) -> Void) {
        let path: String = "/markets/kraken/btceur/ohlc"
        
        APIClient.shared.request(path, completion: { result in
            completion(result)
        })
     }
    
//    class func latestListings(completion: @escaping(Result<Response<[CryptoCurrency]>, Error>) -> Void) {
//        let path: String = "/v1/cryptocurrency/listings/latest"
//        let resource: Resource = Resource(path: path)
//        APIClient.shared.request(resource, completion: { result in
//            completion(result)
//        })
//    }
//
//    class func latestListings(completion: @escaping(Result<Response<[CryptoCurrency]>, Error>) -> Void) {
//        let path: String = "/v1/cryptocurrency/listings/latest"
//        let resource: Resource = Resource(path: path)
//        APIClient.shared.request(resource, completion: { result in
//            completion(result)
//        })
//    }
//
//    class func latestListings(completion: @escaping(Result<Response<[CryptoCurrency]>, Error>) -> Void) {
//        let path: String = "/v1/cryptocurrency/listings/latest"
//        let resource: Resource = Resource(path: path)
//        APIClient.shared.request(resource, completion: { result in
//            completion(result)
//        })
//    }
//
//    class func latestListings(completion: @escaping(Result<Response<[CryptoCurrency]>, Error>) -> Void) {
//        let path: String = "/v1/cryptocurrency/listings/latest"
//        let resource: Resource = Resource(path: path)
//        APIClient.shared.request(resource, completion: { result in
//            completion(result)
//        })
//    }
//
//    class func latestListings(completion: @escaping(Result<Response<[CryptoCurrency]>, Error>) -> Void) {
//        let path: String = "/v1/cryptocurrency/listings/latest"
//        let resource: Resource = Resource(path: path)
//        APIClient.shared.request(resource, completion: { result in
//            completion(result)
//        })
//    }
    
    
}
