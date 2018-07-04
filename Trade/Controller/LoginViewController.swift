
import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpLabel: UILabel!
    @IBOutlet weak var loginButton: LoadingButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //label register
        let tabGesture = UITapGestureRecognizer(target: self, action:  #selector (self.registerAction (_:)))
        signUpLabel.isUserInteractionEnabled = true
        signUpLabel.addGestureRecognizer(tabGesture)
        
        //button login
        loginButton.addTarget(self, action: #selector(buttonClicked(button:)), for: .touchUpInside)
    }
    
    @objc func registerAction(_ sender:UITapGestureRecognizer){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let registerViewController = storyBoard.instantiateViewController(withIdentifier: "register_view") as! RegisterViewController
        self.present(registerViewController, animated:true, completion:nil)
    }
    
   @objc func buttonClicked(button: UIButton) {    
        self.loginButton.showLoading()
        self.usernameTextField.isUserInteractionEnabled = false
        self.passwordTextField.isUserInteractionEnabled = false
    
        let username = self.usernameTextField.text
        let password = self.passwordTextField.text
    
    let parameters:[String: String] = ["username": username!,"password": password!]

    Alamofire.request(ADDR.LOGIN, method: .post, parameters: parameters, encoding: URLEncoding.httpBody).responseJSON { response in
            if let json = response.result.value {
                    let jsonData = json as! [String  : Any]
                    let code = jsonData["code"] as? Int
                    let username = jsonData["username"] as? String
                
                    if code == 1000 {
                        UserDefaults.standard.set(true, forKey: "isLoggedIn")
                        UserDefaults.standard.set(username, forKey: "username")
                        UserDefaults.standard.synchronize()
                        
                        DispatchQueue.main.async {
                            self.loginButton.hideLoading()
                            
                            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                            let tabBarViewController = storyBoard.instantiateViewController(withIdentifier: "tabbar") as! TabBarViewController
                            self.present(tabBarViewController, animated:true, completion:nil)
                        }
                    } else {
                        DispatchQueue.main.async {
                            self.loginButton.hideLoading()
                            
                            self.usernameTextField.isUserInteractionEnabled = true
                            self.passwordTextField.isUserInteractionEnabled = true
                            
                            self.usernameTextField.text = ""
                            self.passwordTextField.text = ""
                            
                            let alert = UIAlertController(title: "Alert", message: "username or password not correct", preferredStyle: UIAlertControllerStyle.alert)
                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        }
                }
            }
        }
    }
}








