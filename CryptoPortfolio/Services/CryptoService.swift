//
//  CryptoService.swift
//  CryptoPortfolio
//
//  Created by Jonas Pedersen on 18/12/2020.
//

import Foundation

final class Services {
    
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
    
    class func fetchOHLCCandleStickData(completion: @escaping(Result<CryptowatchResponse<[Double]>, Error>) -> Void) {
        let path: String = "/markets/kraken/btceur/ohlc"
        
        APIClient.shared.request(path, completion: { result in
            completion(result)
        })
     }
    
    class func fetchMarkets(completion: @escaping(Result<CryptowatchResponse<Market>, Error>) -> Void) {
        let path: String = "/markets"
        
        APIClient.shared.request(path, completion: { result in
            completion(result)
        })
     }
    
    class func fetchAssets(completion: @escaping(Result<CryptowatchResponse<Asset>, Error>) -> Void) {
        let path: String = "/assets"
        
        APIClient.shared.request(path, completion: { result in
            completion(result)
        })
    }
    
    class func fetchIcons() {
        //  https://cryptoicons.org/api/:style/:currency/:size       
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
