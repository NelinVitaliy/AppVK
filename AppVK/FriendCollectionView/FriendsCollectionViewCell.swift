//
//  FriendsCollectionViewCell.swift
//  AppVK
//
//  Created by N3L1N on 16/04/2022.
//

import UIKit

class FriendsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageAvatar: UIImageView!
    @IBOutlet var nameAvatar: UILabel!
    
    @IBOutlet var likeControler: LikeControl!
    @IBOutlet var containerView: UIView!
    
    override func awakeFromNib() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.numberOfTapsRequired = 2
        contentView.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_:UITapGestureRecognizer) {
        likeControler.isLike.toggle()
        
        if likeControler.isLike {
            likeControler.likePicture.image = UIImage(systemName: "bolt.heart")
        } else {
            likeControler.likePicture.image = nil
        }
    }
    
}
