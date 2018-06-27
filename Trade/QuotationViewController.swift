
import UIKit
import Alamofire

class QuotationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var usdtButton: UIButton!
    @IBOutlet weak var btcButton: UIButton!
    @IBOutlet weak var ethButton: UIButton!
    
    @IBOutlet weak var priceTableView: UITableView!
    
    var loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    var prices = [Price]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        priceTableView.dataSource = self
        priceTableView.delegate = self
        
        usdtButton.addTarget(self, action:  #selector(buttonClicked(button:)), for: .touchUpInside)
        btcButton.addTarget(self, action:  #selector(buttonClicked(button:)), for: .touchUpInside)
        ethButton.addTarget(self, action:  #selector(buttonClicked(button:)), for: .touchUpInside)
        
        loadData(url: ADDR.PRICE_USDT)
    }
    
    @objc func buttonClicked(button: UIButton) {
        usdtButton.setTitleColor(.black, for: .normal)
        btcButton.setTitleColor(.black, for: .normal)
        ethButton.setTitleColor(.black, for: .normal)
        
        usdtButton.backgroundColor = UIColor(red: 238/255, green: 237/255, blue: 243/255, alpha: 1.0)
        btcButton.backgroundColor = UIColor(red: 238/255, green: 237/255, blue: 243/255, alpha: 1.0)
        ethButton.backgroundColor = UIColor(red: 238/255, green: 237/255, blue: 243/255, alpha: 1.0)
        
        if button === usdtButton {
            usdtButton.setTitleColor(.white, for: .normal)
            usdtButton.backgroundColor = UIColor(red: 105/255, green: 105/255, blue: 229/255, alpha: 1.0)
            loadData(url: ADDR.PRICE_USDT)
        } else if button === btcButton {
            btcButton.setTitleColor(.white, for: .normal)
            btcButton.backgroundColor = UIColor(red: 105/255, green: 105/255, blue: 229/255, alpha: 1.0)
            loadData(url: ADDR.PRICE_BTC)
        } else if button === ethButton {
            ethButton.setTitleColor(.white, for: .normal)
            ethButton.backgroundColor = UIColor(red: 105/255, green: 105/255, blue: 229/255, alpha: 1.0)
            loadData(url: ADDR.PRICE_ETH)
        }
    }
    
    func loadData(url: String) {
        self.priceTableView.isHidden = true
        
        self.loadingIndicator.center = self.view.center
        self.loadingIndicator.hidesWhenStopped = true
        self.loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        self.view.addSubview(self.loadingIndicator)
        self.loadingIndicator.startAnimating()
        
        Alamofire.request(url) .responseJSON { response in
            self.prices.removeAll()
            
            if let json = response.result.value {
                let jsonData = json as! [String  : Any]
                let pricesJson = jsonData["prices"] as? NSArray
                
                for priceJson in pricesJson! {
                    let priceData = priceJson as! [String : Any]
                    let title = priceData["title"] as! String
                    let value = priceData["value"] as! String
                    let trend = priceData["trend"] as! String
                    let trend_sign = priceData["trend_sign"] as! String
                    
                    let price = Price(title: title, value: value, trend: trend, trend_sign: trend_sign)
                    self.prices.append(price)
                    
                    print(title)
                }
                
                DispatchQueue.main.async {
                    self.loadingIndicator.isHidden = true
                    self.priceTableView.isHidden = false
                    
                    self.priceTableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prices.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let priceTableViewCell = tableView.dequeueReusableCell(withIdentifier: "price_table_cell", for: indexPath) as! PriceTableViewCell
        priceTableViewCell.titleLabel.text = prices[indexPath.row].title
        priceTableViewCell.valueLabel.text = prices[indexPath.row].value
        priceTableViewCell.trendLabel.text = prices[indexPath.row].trend
        
        if prices[indexPath.row].trend_sign == "p" {
            priceTableViewCell.trendLabel.backgroundColor = UIColor(red: 80/255, green: 195/255, blue: 130/255, alpha: 1.0)
        } else {
            priceTableViewCell.trendLabel.backgroundColor = UIColor(red: 239/255, green: 121/255, blue: 85/255, alpha: 1.0)
        }
        
        return priceTableViewCell
    }
}
