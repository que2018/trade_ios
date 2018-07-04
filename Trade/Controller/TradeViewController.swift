
import UIKit
import Alamofire

class TradeViewController: UIViewController,   UITableViewDelegate, UITableViewDataSource {
    
     var trades = [Trade]()
    
     @IBOutlet weak var tableWrapView: UIView!
     @IBOutlet weak var tradeTableView: UITableView!
    
    var loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tradeTableView.dataSource = self
        tradeTableView.delegate = self
        
        loadData(url: ADDR.TRADE)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trades.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let tradeTableHeaderView  = TradeTableHeaderView()
        return tradeTableHeaderView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tradeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "trade_table_cell", for: indexPath) as! TradeTableViewCell
        
        tradeTableViewCell.indexBuyLabel.text = String(indexPath.row + 1)
        tradeTableViewCell.valueBuyLabel.text = trades[indexPath.row].valueBuy
        tradeTableViewCell.priceBuyLabel.text = trades[indexPath.row].priceBuy
        tradeTableViewCell.indexSellLabel.text = String(indexPath.row + 1)
        tradeTableViewCell.valueSellLabel.text = trades[indexPath.row].valueSell
        tradeTableViewCell.priceSellLabel.text = trades[indexPath.row].priceSell
        
        return tradeTableViewCell
    }
    
    func loadData(url: String) {
        self.tradeTableView.isHidden = true
        
        self.loadingIndicator.center = self.tableWrapView.center
        self.loadingIndicator.hidesWhenStopped = true
        self.loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        self.tableWrapView.addSubview(self.loadingIndicator)
        self.loadingIndicator.startAnimating()
        
        Alamofire.request(url) .responseJSON { response in
            self.trades.removeAll()
            
            if let json = response.result.value {
                let jsonData = json as! [String  : Any]
                let tradesJson = jsonData["trades"] as? NSArray
                
                for tradeJson in tradesJson! {
                    let tradeData = tradeJson as! [String : Any]
                    let valueBuy = tradeData["value_buy"] as! String
                    let priceBuy = tradeData["price_buy"] as! String
                    let valueSell = tradeData["value_sell"] as! String
                    let priceSell = tradeData["price_sell"] as! String

                    let trade = Trade(valueBuy: valueBuy, priceBuy: priceBuy, valueSell: valueSell,  priceSell: priceSell)
                    self.trades.append(trade)
                }
                
                DispatchQueue.main.async {
                    self.loadingIndicator.isHidden = true
                    self.tradeTableView.isHidden = false
                    
                    self.tradeTableView.reloadData()
                }
            }
        }
    }
}

