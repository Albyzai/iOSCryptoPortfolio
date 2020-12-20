//
//  CryptoDetailViewController.swift
//  CryptoPortfolio
//
//  Created by Jonas Pedersen on 19/12/2020.
//

import UIKit
import Charts

class CryptoDetailViewController: UIViewController, ChartViewDelegate {

    @IBOutlet weak var chart: CandleStickChartView!
    
    var detailText: String?
//    var crypto: CryptoCurrency?
    @IBOutlet weak var detailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        configureChart()
        setData()
//        detailLabel.text = crypto?.symbol
        // Do any additional setup after loading the view.
    }
    
    private func configureChart() {
        let xAxis = chart.xAxis
        let yAxis = chart.leftAxis
        
        chart.delegate = self
        chart.dragEnabled = false
        chart.rightAxis.enabled = false
        
        xAxis.labelPosition = .bottom
        
        
    }

    func setData() {
        let yVals1 = (0..<100).map { (i) -> CandleChartDataEntry in
                    let mult = UInt32(2) + 1
                    let val = Double(arc4random_uniform(40) + mult)
                    let high = Double(arc4random_uniform(9) + 8)
                    let low = Double(arc4random_uniform(9) + 8)
                    let open = Double(arc4random_uniform(6) + 1)
                    let close = Double(arc4random_uniform(6) + 1)
                    let even = i % 2 == 0
                    
                    return CandleChartDataEntry(x: Double(i), shadowH: val + high, shadowL: val - low, open: even ? val + open : val - open, close: even ? val - close : val + close)
                }
                
                let set1 = CandleChartDataSet(entries: yVals1, label: "Data Set")
                set1.axisDependency = .left
                set1.setColor(UIColor(white: 80/255, alpha: 1))
                set1.drawIconsEnabled = false
                set1.shadowColor = .darkGray
                set1.shadowWidth = 0.7
                set1.decreasingColor = .red
                set1.decreasingFilled = true
                set1.increasingColor = UIColor(red: 122/255, green: 242/255, blue: 84/255, alpha: 1)
                set1.increasingFilled = false
                set1.neutralColor = .blue
                
                let data = CandleChartData(dataSet: set1)
                chart.data = data
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

