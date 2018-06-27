import UIKit
import ImageSlideshow

class HomeViewController: UIViewController {

    @IBOutlet weak var usdValue: UILabel!
    @IBOutlet weak var atdValue: UILabel!
    @IBOutlet weak var btcValue: UILabel!
    @IBOutlet weak var ltcValue: UILabel!
    @IBOutlet weak var rzcValue: UILabel! 
    @IBOutlet weak var hcoValue: UILabel!
    @IBOutlet weak var btoValue: UILabel!
    @IBOutlet weak var btgValue: UILabel!
    @IBOutlet weak var bchValue: UILabel!
    
    @IBOutlet weak var usdTrend: UILabel!
    @IBOutlet weak var atdTrend: UILabel!
    @IBOutlet weak var btcTrend: UILabel!
    @IBOutlet weak var ltcTrend: UILabel!
    @IBOutlet weak var rzcTrend: UILabel!
    @IBOutlet weak var hcoTrend: UILabel!
    @IBOutlet weak var btoTrend: UILabel!
    @IBOutlet weak var btgTrend: UILabel!
    @IBOutlet weak var bchTrend: UILabel!

    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var slideShow: ImageSlideshow!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //login button shadow 
        loginButton.layer.shadowColor = UIColor(red: 86, green: 86, blue: 187, alpha: 0.25).cgColor
        loginButton.layer.shadowOffset = CGSize(width: 0.0,  height: 3.0)
        loginButton.layer.shadowOpacity = 1.0
        loginButton.layer.shadowRadius = 0.0
        loginButton.layer.masksToBounds = false
        loginButton.layer.cornerRadius = 0
        
        slideShow.setImageInputs([
            ImageSource(image: UIImage(named: "slide1")!),
            AlamofireSource(urlString:  ADDR.Slide1)!
            ])
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData()  {
        guard let url = URL(string: ADDR.Home) else  { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            
            do {
                 let jsonData = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as! [String: Any]
                
                 let usd = jsonData["usd"] as! [String: Any]
                 let atd = jsonData["atd"] as! [String: Any]
                 let btc = jsonData["btc"] as! [String: Any]
                 let ltc = jsonData["ltc"] as! [String: Any]
                 let rzc = jsonData["rzc"] as! [String: Any]
                 let hco = jsonData["hco"] as! [String: Any]
                 let bto = jsonData["bto"] as! [String: Any]
                 let btg = jsonData["btg"] as! [String: Any]
                 let bch = jsonData["bch"] as! [String: Any]
                
                let pColor = UIColor(red: 0.31, green: 0.76, blue: 0.50, alpha: 1)
                let nColor = UIColor(red: 0.93, green: 0.47, blue: 0.33, alpha: 1)

                DispatchQueue.main.async {
                    self.usdValue.text = usd["value" ] as? String
                    self.atdValue.text = atd["value"] as? String
                    self.btcValue.text = btc["value"] as? String
                    self.ltcValue.text = ltc["value"] as? String
                    self.rzcValue.text = rzc["value"] as? String
                    self.hcoValue.text = hco["value"] as? String
                    self.btoValue.text = bto["value"] as? String
                    self.btgValue.text = btg["value"] as? String
                    self.bchValue.text = bch["value"] as?String
                    
                    let usdTrend = usd["trend"] as! String
                    let atdTrend = atd["trend"] as! String
                    let btcTrend = btc["trend"] as! String
                    let ltcTrend = ltc["trend"] as! String
                    let rzcTrend = rzc["trend"] as! String
                    let hcoTrend = hco["trend"] as! String
                    let btoTrend = bto["trend"] as! String
                    let btgTrend = btg["trend"] as! String
                    let bchTrend = bch["trend"] as! String

                    if usd["type"] as! String == "P" {
                        self.usdTrend .text = "+" + usdTrend + "%"
                        self.usdTrend.textColor = pColor;
                    } else {
                        self.usdTrend .text = "-" + usdTrend + "%"
                        self.usdTrend.textColor = nColor;
                    }
                    
                    if atd["type"] as! String == "P" {
                        self.atdTrend .text = "+" + atdTrend + "%"
                        self.atdTrend.textColor = pColor;
                    } else {
                        self.atdTrend .text = "-" + atdTrend + "%"
                        self.atdTrend.textColor = nColor;
                    }
                    
                    if btc["type"] as! String == "P" {
                        self.btcTrend .text = "+" + btcTrend + "%"
                        self.btcTrend.textColor = pColor;
                    } else {
                        self.btcTrend .text = "-" + btcTrend + "%"
                        self.btcTrend.textColor = nColor;
                    }
                    
                    if ltc["type"] as! String == "P" {
                        self.ltcTrend .text = "+" + ltcTrend + "%"
                        self.ltcTrend.textColor = pColor;
                    } else {
                        self.ltcTrend .text = "-" + ltcTrend + "%"
                        self.ltcTrend.textColor = nColor;
                    }
                    
                    if rzc["type"] as! String == "P" {
                        self.rzcTrend .text = "+" + rzcTrend + "%"
                        self.rzcTrend.textColor = pColor;
                    } else {
                        self.rzcTrend .text = "-" + rzcTrend + "%"
                        self.rzcTrend.textColor = nColor;
                    }
                    
                    if hco["type"] as! String == "P" {
                        self.hcoTrend .text = "+" + hcoTrend + "%"
                        self.hcoTrend.textColor = pColor;
                    } else {
                        self.hcoTrend .text = "-" + hcoTrend + "%"
                        self.hcoTrend.textColor = nColor;
                    }
                    
                    if bto["type"] as! String == "P" {
                        self.btoTrend .text = "+" + btoTrend + "%"
                        self.btoTrend.textColor = pColor;
                    } else {
                        self.btoTrend .text = "-" + btoTrend + "%"
                        self.btoTrend.textColor = nColor;
                    }
                    
                    if btg["type"] as! String == "P" {
                        self.btgTrend .text = "+" + btgTrend + "%"
                        self.btgTrend.textColor = pColor;
                    } else {
                        self.btgTrend .text = "-" + btgTrend + "%"
                        self.btgTrend.textColor = nColor;
                    }
                    
                    if bch["type"] as! String == "P" {
                        self.bchTrend .text = "+" + bchTrend + "%"
                        self.bchTrend.textColor = pColor;
                    } else {
                        self.bchTrend .text = "-" + bchTrend + "%"
                        self.bchTrend.textColor = nColor;
                    }
                }
            } catch let jsonErr {}
        }.resume()
    }
}
