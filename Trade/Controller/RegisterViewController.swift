
import UIKit
import Alamofire

class RegisterViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: BottomBorderTextField!
    @IBOutlet weak var lastNameTextField: BottomBorderTextField!
    @IBOutlet weak var emailTextField: BottomBorderTextField!
    @IBOutlet weak var phoneNumberTextField: BottomBorderTextField!
    @IBOutlet weak var smsTextField: BottomBorderTextField!
    @IBOutlet weak var passwordTextField: BottomBorderTextField!
    @IBOutlet weak var passwordConfirmTextField: BottomBorderTextField!
    @IBOutlet weak var referenceTextField: BottomBorderTextField!
    
    @IBOutlet weak var registerButton: LoadingButton!
    @IBOutlet weak var getCodeButton: LoadingButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //button login
        getCodeButton.addTarget(self, action: #selector(getCodeButtonClicked(button:)), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(registerButtonClicked(button:)), for: .touchUpInside)
    }
    
    @objc func getCodeButtonClicked(button: UIButton) {
        self.getCodeButton.showLoading()
        self.smsTextField.isUserInteractionEnabled = false
        
        let sms = self.smsTextField.text
        
        let parameters:[String: String] = [
            "sms": sms!
        ]
        
        Alamofire.request(ADDR.REGISTER_SMS, method: .post, parameters: parameters, encoding: URLEncoding.httpBody).responseJSON { response in
            if let json = response.result.value {
                let jsonData = json as! [String  : Any]
                let code = jsonData["code"] as? Int
        
                DispatchQueue.main.async {
                    self.getCodeButton.hideLoading()
                    self.smsTextField.isUserInteractionEnabled = true
                    self.smsTextField.text = ""
                }
            }
        }
    }
    
    @objc func registerButtonClicked(button: UIButton) {
        self.registerButton.showLoading()
        self.firstNameTextField.isUserInteractionEnabled = false
        self.lastNameTextField.isUserInteractionEnabled = false
        self.emailTextField.isUserInteractionEnabled = false
        self.phoneNumberTextField.isUserInteractionEnabled = false
        self.smsTextField.isUserInteractionEnabled = false
        self.passwordTextField.isUserInteractionEnabled = false
        self.passwordConfirmTextField.isUserInteractionEnabled = false
        self.referenceTextField.isUserInteractionEnabled = false
        
        let firstName = self.firstNameTextField.text
        let lastName  = self.lastNameTextField.text
        let email = self.phoneNumberTextField.text
        let phoneNumber = self.smsTextField.text
        let sms = self.passwordTextField.text
        let password = self.passwordTextField.text
        let passwordConfirm = self.passwordConfirmTextField.text
        let reference = self.referenceTextField.text
        
        let parameters:[String: String] = [
                "firstname": firstName!,
                "lastname": lastName!,
                "email": email!,
                "phone_number": phoneNumber!,
                "sms": sms!,
                "password": password!,
                "password_confirm": passwordConfirm!,
                "reference": reference!
        ]
        
        Alamofire.request(ADDR.REGISTER, method: .post, parameters: parameters, encoding: URLEncoding.httpBody).responseJSON { response in
            if let json = response.result.value {
                let jsonData = json as! [String  : Any]
                let code = jsonData["code"] as? Int
                
                if code == 1000 {
                    DispatchQueue.main.async {
                        self.registerButton.hideLoading()
                        
                        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                        let loginViewController = storyBoard.instantiateViewController(withIdentifier: "login_view") as! LoginViewController
                        self.present(loginViewController, animated:true, completion:nil)
                    }
                } else {
                    DispatchQueue.main.async {
                        self.registerButton.hideLoading()
                        
                        self.firstNameTextField.isUserInteractionEnabled = true
                        self.lastNameTextField.isUserInteractionEnabled = true
                        self.emailTextField.isUserInteractionEnabled = true
                        self.phoneNumberTextField.isUserInteractionEnabled = true
                        self.smsTextField.isUserInteractionEnabled = true
                        self.passwordTextField.isUserInteractionEnabled = true
                        self.passwordConfirmTextField.isUserInteractionEnabled = true
                        self.referenceTextField.isUserInteractionEnabled = true
                        
                        self.firstNameTextField.text = ""
                        self.lastNameTextField.text = ""
                        self.emailTextField.text = ""
                        self.phoneNumberTextField.text = ""
                        self.smsTextField.text = ""
                        self.passwordTextField.text = ""
                        self.passwordConfirmTextField.text = ""
                        self.referenceTextField.text = ""
                        
                        let alert = UIAlertController(title: "Alert", message: "information not correct", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            }
        }
    }
}
