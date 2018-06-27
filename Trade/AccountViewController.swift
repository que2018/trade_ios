
import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var balanceView: UIView!
    @IBOutlet weak var orderView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let touchGesture = UITapGestureRecognizer(target: self, action:  #selector (self.someAction (_:)))
        self.balanceView.addGestureRecognizer(touchGesture)
        //self.orderView.addGestureRecognizer(touchGesture)
    }
    
    @objc func someAction(_ sender:UITapGestureRecognizer){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        print(sender.view!.restorationIdentifier)
        
        if sender.view!.restorationIdentifier == "balance" {
            let balanceViewController = storyBoard.instantiateViewController(withIdentifier: "balance_view") as! BalanceViewController
            self.present(balanceViewController, animated:true, completion:nil)
        }
        
        if sender.view!.restorationIdentifier == "order" {
            let orderViewController = storyBoard.instantiateViewController(withIdentifier: "order_view") as! OrderViewController
            self.present(orderViewController, animated:true, completion:nil)
        }
    }
}
