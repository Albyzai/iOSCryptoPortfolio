//
//  ViewController.swift
//  CryptoPortfolio
//
//  Created by Jonas Pedersen on 17/12/2020.
//

import UIKit
import CoreData
import SQLite3
class MainCryptoViewController: UIViewController {
    
    var db: OpaquePointer?
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    @IBOutlet weak var addCryptoButton: UIButton!
    @IBOutlet weak var cryptoTableView: UITableView!
    var cryptos: [String] = []
    var data: [CandleStickEntry] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        Database.shared.initDB()
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("Database.sqlite")
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        }
        // Do any additional setup after loading the view.
        
//        var cryptoDetailVC: CryptoDetailViewController {
//            let vc = CryptoDetailViewController()
//            vc.title = "cryptoDetail"
//            return vc
//        }
//        var purchaseCryptoVC: PurchaseCryptoViewController {
//            let vc = PurchaseCryptoViewController()
//            vc.title = "purchase crypto"
//            return vc
//        }
        
        self.title = "Main"
        
//        var crypto: CryptoCurrency = CryptoCurrency(from: <#T##Decoder#>)
//        crypto.symbol = "btc"
//
        
        cryptoTableView.dataSource = self
        cryptoTableView.delegate = self
//        Services.fetchOHLCCandleStickData(completion: { result in
//            switch result {
//            case Result.success(let response):
//                print("response data: \(response.result)")
//                break
//            case Result.failure(let error):
//                print("error: \(error)")
//                break
//            }
//        })
//
//        Services.fetchMarkets(completion: { result in
//            switch result {
//            case Result.success(let response):
//                print("response data: \(response.result)")
//                break
//            case Result.failure(let error):
//                print("error: \(error)")
//                break
//            }
//        })
//        Services.latestListings(completion: { result in
//            switch result {
//            case Result.success(let response):
//                print("response data: \(response.data)")
//                self.cryptos = response.data
//                DispatchQueue.main.async {
//                    self.cryptoTableView.reloadData()
//                }
//
//                print("cryptos: \(self.cryptos)")
//                break
//            case Result.failure(let error):
//                print(error)
//                break
//            }
//        })
        
    }
    
    
    
    


}

//extension UIViewController {
//
//    var context: NSManagedObjectContext {
//        get {
//            return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//        }
//    }
//
//
//}

//extension UIViewController {
//    func saveItems() {
//        do {
//            try self.context.save()
//        } catch {
//
//        }
//    }
//
//    func loadItems() {
//
//    }
//}
extension MainCryptoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoTableViewCell") as? CryptoTableViewCell {
            cell.configureCell(crypto: self.cryptos[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(cryptos)
        return self.cryptos.count
    }
    
    
    
}

extension MainCryptoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let detailVC = storyboard?.instantiateViewController(identifier: "CryptoDetailViewController") as! CryptoDetailViewController
//        let navVC = NavigationController(rootViewController: self)
//        navVC.modalPresentationStyle = .fullScreen
//        detailVC.crypto = self.cryptos[indexPath.row]
//        navigationController?.pushViewController(detailVC, animated: true)
//
    }
}


