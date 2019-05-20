//
//  FriendDetailViewController.swift
//  NIBMConnect
//
//  Created by Yasith Thathsara Senarathne on 5/21/19.
//  Copyright © 2019 Yasith Thathsara Senarathne. All rights reserved.
//

import UIKit
import Kingfisher

class FriendDetailViewController: UIViewController {

    var selectedFriend: Friend?
    

    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var fbUrl: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadData()

    }
    
    //LoadData to controllers
    func loadData(){
        let url = URL(string:(self.selectedFriend?.profileImageURL)!)
        profileImage.kf.indicatorType = .activity
        let processor = RoundCornerImageProcessor(cornerRadius: 20)
        profileImage.kf.setImage(with: url , options:[.processor(processor)])
        let profileName = "\(self.selectedFriend?.firstName) \(self.selectedFriend?.lastName)"
        print(profileName)
        fullName.text = "\(self.selectedFriend!.firstName) \(self.selectedFriend!.lastName)"
        cityName.text = self.selectedFriend!.city
        phoneNumber.text = self.selectedFriend!.phoneNumber[0]
        fbUrl.text = self.selectedFriend!.fbProfileURL
    }
}