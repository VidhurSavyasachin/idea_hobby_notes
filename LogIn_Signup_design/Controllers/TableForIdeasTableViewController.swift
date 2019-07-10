//
//  TableForIdeasTableViewController.swift
//  LogIn_Signup_design
//
//  Created by Vidhur Savyasachin on 7/6/19.
//  Copyright © 2019 Shalini Garikapaty. All rights reserved.
//

import UIKit
import Firebase
class TableForIdeasTableViewController: UITableViewController {
    
//    func getLikeValuesFromUsers(value: Int) {
//         if let indexPath = tableView.indexPathForSelectedRow {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath)
//                as! ideaHobbyCell
//             cell.LikeCount.text = "\(value)"
//
//        }
//    }
//

    @IBOutlet var inventoryTableView: UITableView!
    @IBOutlet weak var messageTableView: UITableView!
    
    var inventoryDetails: [InventoryOfHobby] = [InventoryOfHobby]()
    var commentDetails:[Comments] = [Comments]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        messageTableView.register(UINib(nibName: "ideaHobbyCell", bundle: nil), forCellReuseIdentifier: "customMessageCell")
        
        retrievMessages()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return inventoryDetails.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath)
            as! ideaHobbyCell
        cell.titleOfBlog.text = inventoryDetails[indexPath.row].titleOfBlog
        let nsString = inventoryDetails[indexPath.row].contentOfBlog as NSString
        if nsString.length >= 10
        {
            cell.contentOfBlog.text = nsString.substring(with: NSRange(location: 0, length: nsString.length > 20 ? 20 : nsString.length)) + "..."
        }
      
   
        cell.nameOftheAuthor.text = inventoryDetails[indexPath.row].nameOfAuther
        
       
        
        

        return cell
    }
    func retrievMessages(){
     
        let messageDB = Database.database().reference().child("HobbyDetails").child("posts")
  

        messageDB.observe(.childAdded) { (snapshot) in
            let snapshot = snapshot.value as! Dictionary<String,AnyObject>
            let titleOfHobby = snapshot["InterestTitle"]!
            let hobbyDetails = snapshot["interestBody"]!
            let sender = snapshot["sender"]!
            let InvntoryOFHobby = InventoryOfHobby()
            if let Likes = snapshot["Likes"] {
                 InvntoryOFHobby.likes = Likes as! Int
            }
           
            InvntoryOFHobby.nameOfAuther = sender as! String
            InvntoryOFHobby.titleOfBlog = titleOfHobby as! String
            InvntoryOFHobby.contentOfBlog = hobbyDetails as! String
            print(snapshot.keys)
            self.inventoryDetails.append(InvntoryOFHobby)
            self.configureTableView()
            self.inventoryTableView.reloadData()
        }

        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NextPage" {
            if let destinationVC = segue.destination as? ViewInterestsViewController {
                if let indexPath = tableView.indexPathForSelectedRow {

                    destinationVC.titleOfInterest = inventoryDetails[indexPath.row].titleOfBlog
                    destinationVC.contentOfInterest = inventoryDetails[indexPath.row].contentOfBlog
                    destinationVC.authorOfPost = inventoryDetails[indexPath.row].nameOfAuther
                    destinationVC.likeCount = inventoryDetails[indexPath.row].likes

                }
            }
        }

    }
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch  {
            print("Error, problem signing out.")
        }
    
    }
    func loadItems(){
        tableView.reloadData()
    }
    func configureTableView(){
        inventoryTableView.rowHeight = UITableView.automaticDimension
        inventoryTableView.estimatedRowHeight = 200
    }
    @IBAction func addHobbiesIdeas(_ sender: UIBarButtonItem) {
    
        performSegue(withIdentifier: "toMessageView" , sender: self)
    
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "NextPage" , sender: self)
  
        self.tableView.reloadData()
    }

}
