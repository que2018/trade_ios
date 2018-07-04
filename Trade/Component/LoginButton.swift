
import UIKit

class LoginButton: UIButton {
    required init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.backgroundColor = UIColor.white
        self.setTitleColor(UIColor(red: 114/255, green: 116/255, blue: 134/255, alpha: 1), for: .normal)
        self.setTitle("Login", for: .normal)
        
        //self.layer.shadowColor = UIColor(red: 86, green: 86, blue: 187, alpha: 0.25).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0,  height: 0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
