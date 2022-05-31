//
//  LikeControl.swift
//  AppVK
//
//  Created by N3L1N on 28/05/2022.
//

import UIKit

class LikeControl: UIControl {
    
    @IBOutlet var likePicture : UIImageView!
    
    var isLike: Bool = false
    
    override func awakeFromNib() {
        likePicture.backgroundColor = .clear
        likePicture.tintColor = .red
        
    }
    



}
