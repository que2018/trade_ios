
import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var balanceView: UIView!
    @IBOutlet weak var orderView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let balanceTouchGesture = UITapGestureRecognizer(target: self, action:  #selector (self.balanceAction (_:)))
        self.balanceView.addGestureRecognizer(balanceTouchGesture)
        
        let orderTouchGesture = UITapGestureRecognizer(target: self, action:  #selector (self.orderAction (_:)))
        self.orderView.addGestureRecognizer(orderTouchGesture)
    }
    
    @objc func balanceAction(_ sender:UITapGestureRecognizer){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let balanceViewController = storyBoard.instantiateViewController(withIdentifier: "balance_view") as! BalanceViewController
        self.present(balanceViewController, animated:true, completion:nil)
    }
    
    @objc func orderAction(_ sender:UITapGestureRecognizer){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let balanceViewController = storyBoard.instantiateViewController(withIdentifier: "balance_view") as! BalanceViewController
        self.present(balanceViewController, animated:true, completion:nil)
    }
}
