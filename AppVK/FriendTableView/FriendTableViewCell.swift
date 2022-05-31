//
//  FriendTableViewCell.swift
//  AppVK
//
//  Created by N3L1N on 16/04/2022.
//

import UIKit

class FriendTableViewCell:
    
    UITableViewCell {
    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var nameUser: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imageUser.layer.cornerRadius = imageUser.bounds.width/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
