//
//  PurchaseCryptoViewController.swift
//  CryptoPortfolio
//
//  Created by Jonas Pedersen on 20/12/2020.
//

import UIKit


class PurchaseCryptoViewController: UIViewController {
    var cryptos: [Asset] = []
    @IBOutlet weak var currencyTV: UITableView!
    @IBOutlet weak var searchCoinField: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyTV.dataSource = self
        currencyTV.delegate = self
        
        // Do any additional setup after loading the view.
                Services.fetchAssets(completion: { result in
                    switch result {
                    case Result.success(let response):
                        self.cryptos = response.result
                        DispatchQueue.main.async {
                            self.currencyTV.reloadData()
                        }
                        break
                    case Result.failure(let error):
                        print("error: \(error)")
                        break
                    }
                })
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension PurchaseCryptoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCurrencyTableViewCell") as? CryptoCurrencyTableViewCell {
            cell.configureCell(crypto: self.cryptos[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptos.count
    }
    
    
    
}

extension PurchaseCryptoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let purchaseCryptoVC = storyboard?.instantiateViewController(identifier: "PurchaseCryptoViewController") as! PurchaseCryptoViewController
//        let navVC = NavigationController(rootViewController: self)
//        navVC.modalPresentationStyle = .fullScreen
//        purchaseCryptoVC.crypto = self.cryptos[indexPath.row]
//        navigationController?.pushViewController(purchaseCryptoVC, animated: true)
        
    }
}
