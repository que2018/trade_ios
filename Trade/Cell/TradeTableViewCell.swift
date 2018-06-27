
import UIKit

class TradeTableViewCell: UITableViewCell {
    
    var indexBuyLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 115/255, green: 116/255, blue: 134/255, alpha: 1.0)
        label.font = label.font.withSize(15)
        label.textAlignment = .center
        return label
    }()
    
    var valueBuyLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 115/255, green: 116/255, blue: 134/255, alpha: 1.0)
        label.font = label.font.withSize(15)
        label.textAlignment = .center
        return label
    }()
    
    var priceBuyLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = UIColor(red: 22/255, green: 177/255, blue: 135/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(15)
        label.textAlignment = .center
        return label
    }()
    
    var indexSellLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 115/255, green: 116/255, blue: 134/255, alpha: 1.0)
        label.font = label.font.withSize(15)
        label.textAlignment = .center
        return label
    }()
    
    var valueSellLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 115/255, green: 116/255, blue: 134/255, alpha: 1.0)
        label.font = label.font.withSize(15)
        label.textAlignment = .center
        return label
    }()
    
    var priceSellLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = UIColor(red: 239/255, green: 120/255, blue: 86/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(15)
        label.textAlignment = .center
        
        return label
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addSubview(indexBuyLabel)
        addSubview(valueBuyLabel)
        addSubview(priceBuyLabel)
        
        addSubview(indexSellLabel)
        addSubview(valueSellLabel)
        addSubview(priceSellLabel)
    
        let views = ["v0":  indexBuyLabel, "v1":  valueBuyLabel, "v2":  priceBuyLabel, "v3":  indexSellLabel, "v4":  valueSellLabel, "v5":  priceSellLabel]
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[v0]-0-[v1]-0-[v2]-0-[v5]-0-[v4]-0-[v3]-0-|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":  indexBuyLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v1":  valueBuyLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v2]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v2":  priceBuyLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v3]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v3":  indexSellLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v4]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v4":  valueSellLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v5]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v5":  priceSellLabel]))
        
        addConstraint(NSLayoutConstraint(item: indexBuyLabel, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.1, constant: 0.0))
        addConstraint(NSLayoutConstraint(item: valueBuyLabel, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.2, constant: 0.0))
        addConstraint(NSLayoutConstraint(item: priceBuyLabel, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.2, constant: 0.0))
        addConstraint(NSLayoutConstraint(item: indexSellLabel, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.1, constant: 0.0))
        addConstraint(NSLayoutConstraint(item: valueSellLabel, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.2, constant: 0.0))
        addConstraint(NSLayoutConstraint(item: priceSellLabel, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.2, constant: 0.0))
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
