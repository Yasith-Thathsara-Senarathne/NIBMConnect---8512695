//
//  FriendTableViewCell.swift
//  NIBMConnect
//
//  Created by Yasith Thathsara Senarathne on 5/19/19.
//  Copyright © 2019 Yasith Thathsara Senarathne. All rights reserved.
//

import UIKit
import Kingfisher

class FriendTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileCityName: UILabel!
    
    
    func setFriends(friend : Friend){
        let url = URL(string:friend.profileImageURL)
        profileImage.kf.indicatorType = .activity
        let processor = RoundCornerImageProcessor(cornerRadius: 20)
        profileImage.kf.setImage(with: url , options:[.processor(processor)])
        profileName.text = "\(friend.firstName) \(friend.lastName)"
        profileCityName.text = friend.city
        self.roundUpImage()
    }
    
    //Roundup image
    func roundUpImage() {
        
        profileImage.layer.borderWidth = 1
        profileImage.layer.masksToBounds = false
        profileImage.layer.cornerRadius = 3
        //This will change with corners of image and height/2 will make this circle shape
        profileImage.clipsToBounds = true
    }
}
