//
//  ForgetPasswordViewController.swift
//  LogIn_Signup_design
//
//  Created by Vidhur Savyasachin on 7/4/19.
//  Copyright © 2019 Shalini Garikapaty. All rights reserved.
//

import UIKit
import Firebase
class ForgetPasswordViewController: UIViewController {

    @IBOutlet weak var TextFieldEntered: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func SubmitPressed(_ sender: UIButton) {
        Auth.auth().sendPasswordReset(withEmail: TextFieldEntered.text!) { error in
            // Your code here
            let alert = UIAlertController(title: "Password reset Link sent", message: "Check your mail to reset the password.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Go Back!", style: .default,handler: nil
            ))
           
            
            self.present(alert, animated: true)
            print("Error has occured,Try again")
                // Error occurred. Inspect error.code and handle error.
            
           
            // Email verification sent.
        }
         _ = navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func BackToLoginPage(_ sender: UIButton) {
    
    
    }
    
}
