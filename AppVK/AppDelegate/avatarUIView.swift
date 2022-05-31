//
//  avatarUIView.swift
//  AppVK
//
//  Created by N3L1N on 16/05/2022.
//

import UIKit

class avatarUIView: UIView {

    @IBOutlet var avatarImageView: UIView!
    @IBOutlet var shadowView: UIView!
    
    var shadowColor = UIColor.black
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        shadowView.layer.shadowColor = shadowColor.cgColor
        shadowView.layer.shadowOffset = .zero
        shadowView.layer.shadowRadius = 7
        shadowView.layer.shadowOpacity = 0.8
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        shadowView.layer.cornerRadius = bounds.height/2
        avatarImageView.layer.cornerRadius = bounds.height/2
        
    }

    
    
}
