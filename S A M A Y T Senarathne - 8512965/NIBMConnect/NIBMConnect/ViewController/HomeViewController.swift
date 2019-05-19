//
//  HomeViewController.swift
//  NIBMConnect
//
//  Created by Yasith Thathsara Senarathne on 5/18/19.
//  Copyright © 2019 Yasith Thathsara Senarathne. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class HomeViewController: UIViewController {

    @IBOutlet weak var friendsTableView: UITableView!
    
    var friends: [Friend] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func loadFriendsData(){
        Database.database().reference().child("Friends").observe(.childAdded, with: {(snapshot) in
        
            if let dictionary = snapshot.value as? [String:AnyObject]{
                let firstname = dictionary["firstname"] as! String
                let lastname = dictionary["lastname"] as! String
                let profileimageurl = dictionary["profileimage"] as! String
                let phonenumber = dictionary["phonenumber"] as! Int
                let fburl = dictionary["fburl"] as! String
                let city = dictionary["city"] as! String
                
                let friend = Friend(firstName: firstname,lastName: lastname,profileImageURL: profileimageurl,phoneNumber: [phonenumber],fbProfileURL: fburl,city: city)
                self.friends.append(friend)
            }
        })
    }
}

extension HomeViewController:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let friend = self.friends[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendListCell") as! FriendTableViewCell
        
        return cell
    }
    
    
}
