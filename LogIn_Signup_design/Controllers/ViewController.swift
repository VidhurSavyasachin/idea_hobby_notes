//
//  ViewController.swift
//  LogIn_Signup_design
//
//  Created by Shalini Garikapaty on 7/3/19.
//  Copyright © 2019 Shalini Garikapaty. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD
class ViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var nameOfUser: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
     
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func RegisterButtonPressed(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: username.text!, password: password.text!) { (user, error) in
            if(error != nil){
                let alert = UIAlertController(title: "Already a user", message: "Try login in", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Try Again!!", style: .default, handler: nil))
                self.present(alert, animated: true)
                self.username.text = ""
                self.password.text = ""
            }else{
                print("Registration Successful")
                SVProgressHUD.dismiss()
                self.performSegue(withIdentifier: "toChat", sender: self)
            }
        }
    
    }
   
}

