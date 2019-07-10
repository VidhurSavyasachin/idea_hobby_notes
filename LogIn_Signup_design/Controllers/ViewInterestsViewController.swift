//
//  ViewInterestsViewController.swift
//  LogIn_Signup_design
//
//  Created by Vidhur Savyasachin on 7/6/19.
//  Copyright © 2019 Shalini Garikapaty. All rights reserved.
//

import UIKit
import Firebase
import FaveButton
protocol getLikeValues {
    func getLikeValuesFromUsers(value: Int)
}
class ViewInterestsViewController: UIViewController {

    
 
    

    @IBOutlet weak var TitleOfInterest: UILabel!
    @IBOutlet weak var descriptionOfInterest: UITextView!
    @IBOutlet weak var LikedPost: UIButton!
    var keyValue: String?
    var likeCount: Int = 0
    var buttonPressed:Bool = false
    @IBOutlet weak var count: UILabel!
    
//

    var delegate: getLikeValues?


    var titleOfInterest: String?
    var contentOfInterest: String?
    var authorOfPost: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TitleOfInterest.text = titleOfInterest?.uppercased()
        descriptionOfInterest.text = contentOfInterest

   
        
        TitleOfInterest.sizeToFit()
     
    }



//    func retrieveMessages(){
//        let messageDB = Database.database().reference().child("HobbyDetails").child("posts")
//
//        let userLiked = Database.database().reference().child("HobbyDetails").child("users")
//        userLiked.observe(.childAdded) { (snapshot) in
//            let snapshot = snapshot.value as! Dictionary<String,AnyObject>
//
////            let countV = snapshot["LikesCount"]!
////            self.count.text! = "\(countV)"
//
//        }
//
//
//
//
//    }
//    func addandSubVotes(addvote: Bool){
//        if addvote {
//            likeCount+=1
//        }
//
//
//
//    }
}


