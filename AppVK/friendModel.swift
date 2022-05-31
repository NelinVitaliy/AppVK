//
//  friendModel.swift
//  AppVK
//
//  Created by N3L1N on 16/04/2022.
//

import Foundation
import UIKit


struct Friend {
    let image : UIImage?
    let name: String
    let friends: [newFriend]
    
}

struct newFriend {
    let imаge: UIImage?
    let name: String
}

let newFriendArray = [
    newFriend(imаge:UIImage(named: "avatar"), name: "User"),
    newFriend(imаge:UIImage(named: "avatar"), name: "User"),
    newFriend(imаge:UIImage(named: "avatar"), name: "User"),
    newFriend(imаge:UIImage(named: "avatar"), name: "User"),
    newFriend(imаge:UIImage(named: "avatar"), name: "User"),
    newFriend(imаge:UIImage(named: "avatar"), name: "User"),
    newFriend(imаge:UIImage(named: "avatar"), name: "User"),
    newFriend(imаge:UIImage(named: "avatar"), name: "User"),
]
