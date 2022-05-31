//
//  FriendCollectionViewController.swift
//  AppVK
//
//  Created by N3L1N on 16/04/2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class FriendCollectionViewController: UICollectionViewController {
    
    var arrayFriends: [newFriend] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return arrayFriends.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "friendCellCollection", for: indexPath) as? FriendsCollectionViewCell else {
            preconditionFailure("Error")
        }
        cell.nameAvatar.text = arrayFriends[indexPath.row].name
        cell.imageAvatar.image = arrayFriends[indexPath.row].imаge
        return cell
    }
}
