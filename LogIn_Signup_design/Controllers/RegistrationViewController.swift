//
//  RegistrationViewController.swift
//  LogIn_Signup_design
//
//  Created by Vidhur Savyasachin on 7/3/19.
//  Copyright © 2019 Shalini Garikapaty. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD
class RegistrationViewController: UIViewController {

    @IBOutlet weak var logInUsername: UITextField!
    @IBOutlet weak var PasswordLogin: UITextField!

    @IBOutlet weak var ForgetPassword: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
//       designingUname()
       
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
  
    @IBAction func LoginButtonPressed(_ sender: UIButton) {
      
        Auth.auth().signIn(withEmail: logInUsername.text!, password: PasswordLogin.text!) { (user, error) in
            if error != nil {
                print(error!)
                let alert = UIAlertController(title: "Wrong id/password", message: "Try again with right credentials.", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Try Again!!", style: .default, handler: nil))
                self.present(alert, animated: true)
               self.logInUsername.text = ""
                self.PasswordLogin.text = ""
                
            }else{
                print("Success")
                SVProgressHUD.dismiss()
                self.performSegue(withIdentifier: "toChat", sender: self)
            }
        }
       

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
//    func designingUname(){
//        let bottomLine = CALayer()
//        bottomLine.frame = CGRect(origin: CGPoint(x: 0, y:logInUsername.frame.height - 1), size: CGSize(width: logInUsername.frame.width, height:  1))
//        bottomLine.backgroundColor = UIColor.white.cgColor
//        logInUsername.borderStyle = UITextField.BorderStyle.none
//        logInUsername.layer.addSublayer(bottomLine)
//        PasswordLogin.borderStyle = UITextField.BorderStyle.none
//        PasswordLogin.layer.addSublayer(bottomLine)
//    }

    @IBAction func ForgotButtonPressed(_ sender: UIButton) {
            
    
    
    
    }
}
