
import UIKit

class PriceTableViewCell: UITableViewCell {

    var trendSign = "p"
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "--"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 115/255, green: 116/255, blue: 134/255, alpha: 1.0)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    var valueLabel: UILabel = {
        let label = UILabel()
        label.text = "--"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 115/255, green: 116/255, blue: 134/255, alpha: 1.0)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    var trendLabel: UILabel = {
        let label = UILabel()
        label.text = "--"
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor(red: 80/255, green: 195/255, blue: 130/255, alpha: 1.0)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addSubview(titleLabel)
        addSubview(valueLabel)
        addSubview(trendLabel)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":  titleLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":  titleLabel]))
        
        addConstraint(NSLayoutConstraint(item: valueLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: valueLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v1":  valueLabel]))
        
        addConstraint(NSLayoutConstraint(item: trendLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100))
        addConstraint(NSLayoutConstraint(item: trendLabel, attribute: .trailingMargin, relatedBy: .equal, toItem: self, attribute: .trailingMargin, multiplier: 1, constant: -20))
        addConstraint(NSLayoutConstraint(item: trendLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0.6, constant: 0.0))
        addConstraint(NSLayoutConstraint(item: trendLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
