//
//  CryptoTableViewCell.swift
//  CryptoPortfolio
//
//  Created by Jonas Pedersen on 19/12/2020.
//

import Foundation
import UIKit

class CryptoTableViewCell: UITableViewCell {
    @IBOutlet weak var coinIcon: UIImageView!
    @IBOutlet weak var coinName: UILabel!
    @IBOutlet weak var holdingLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func configureCell(crypto: String) {
//        coinName.text = crypto.symbol ?? "placeholder symbol"
        holdingLabel.text = "1"
        priceLabel.text = "100"
    }
}
