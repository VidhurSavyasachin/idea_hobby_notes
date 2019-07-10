//
//  CommentsDesign.swift
//  LogIn_Signup_design
//
//  Created by Vidhur Savyasachin on 7/6/19.
//  Copyright © 2019 Shalini Garikapaty. All rights reserved.
//

import UIKit

class CommentsDesign: UITableViewCell {
    @IBOutlet weak var OwnerOfComment: UILabel!
    @IBOutlet weak var comment: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
