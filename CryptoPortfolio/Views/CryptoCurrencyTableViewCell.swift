//
//  CryptoTableViewCell.swift
//  CryptoPortfolio
//
//  Created by Jonas Pedersen on 19/12/2020.
//

import Foundation
import UIKit

class CryptoCurrencyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cryptoNameLabel: UILabel!
    
    func configureCell(crypto: Asset) {
        cryptoNameLabel.text = crypto.name ?? "no name found"
    }
}
