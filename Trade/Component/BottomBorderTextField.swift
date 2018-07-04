
import UIKit

class BottomBorderTextField: UITextField {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        let border = CALayer()
        let width = CGFloat(0.6)
        border.borderColor = UIColor(red: 213/255, green: 217/255, blue: 244/255, alpha: 1.0).cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
