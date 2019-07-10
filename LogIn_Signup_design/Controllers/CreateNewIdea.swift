//
//  CreateNewIdea.swift
//  LogIn_Signup_design
//
//  Created by Vidhur Savyasachin on 7/6/19.
//  Copyright © 2019 Shalini Garikapaty. All rights reserved.
//

import UIKit
import Firebase
protocol SendBackThe {
    func getNameOfTextField(valuen: Int)
}
class CreateNewIdea: UIViewController {
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var TitleOfHobby: UITextField!
    @IBOutlet weak var detailsOfHobby: UITextView!
    var delegate: SendBackThe?
    var keyValue: String?
    var likeCount: Int = 0
    override func viewDidLoad() {
        self.navigationItem.setHidesBackButton(true, animated: false)
        super.viewDidLoad()
     TitleOfHobby.sizeToFit()
      
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SendToFirebase(_ sender: UIButton) {
        TitleOfHobby.endEditing(true)
        detailsOfHobby.endEditing(true)
        sendButton.isEnabled = false
        
        let hobbyDB = Database.database().reference().child("HobbyDetails")
        let key =   hobbyDB.child("posts").childByAutoId()
        keyValue = key.key!
    
        let hobbyDic = ["sender": Auth.auth().currentUser?.email,"InterestTitle": TitleOfHobby.text!,"interestBody": detailsOfHobby.text!]
        let likeCounts = ["Likes": likeCount]
      key.setValue(hobbyDic) {
            (error, reference) in
        
            if error != nil {
                print(error!)
            }else{
                print("Message Saved Successfully")
                self.TitleOfHobby.isEnabled = true
                self.sendButton.isEnabled = true
                self.detailsOfHobby.text = "Enter your idea/hobby"
                self.TitleOfHobby.text = ""
            }
        }
        key.updateChildValues(likeCounts)
//        key.setValue(likeCounts){
//            (error, reference) in
//
//            if error != nil {
//                print(error!)
//            }else{
//                print("Message Saved Successfully")
//            }
//        }
          _ = navigationController?.popViewController(animated: true)
    }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(keyboardWillShow),
//            name: UIResponder.keyboardWillShowNotification,
//            object: nil
//        )
//    }
//    @objc func keyboardWillShow(_ notification: Notification) {
//        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
//            let keyboardRectangle = keyboardFrame.cgRectValue
//            var keyboardHeight = keyboardRectangle.height
//            if #available(iOS 11.0, *) {
//                let bottomInset = view.safeAreaInsets.bottom
//                keyboardHeight -= bottomInset
//            }
//
//            UIView.animate(withDuration: 0.5) {
//                height.constant = CGFloat(50 + keyboardHeight)
//                self.view.layoutIfNeeded() //if view change, redraw
//            }
//        }
//    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(true, animated: animated)
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        navigationController?.setNavigationBarHidden(false, animated: animated)
//    }

}
