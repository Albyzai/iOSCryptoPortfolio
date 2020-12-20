import UIKit

Services.fetchOHLCCandleStickData(completion: { result in
    switch result {
    case Result.success(let response):
        print("response data: \(response.result)")
        break
    case Result.failure(let error):
        print("error: \(error)")
        break
    }
})
