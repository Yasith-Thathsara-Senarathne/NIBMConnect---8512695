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

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var friends: [Friend] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        //Check if the list is already filled
        if friends.count > 0
        {
            friends.removeAll()
        }
        else
        {
            loadFriendsData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let friend = self.friends[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "friendListCell" ,for: indexPath) as! FriendTableViewCell

        //Set data to cellview attributes
        cell.setFriends(friend: friend)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showFriendDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? FriendDetailViewController{
            destination.selectedFriend = self.friends[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    @IBAction func logoutBtn(_ sender: UIButton) {
        
        self.populateAlertBox(title: "Logout", message: "You Want To Logout From the System ?")
    }
    
    //Signout user function
    func signOut() -> Bool{
        do{
            try Auth.auth().signOut()
            self.dismiss(animated: true, completion: nil)
            return true
        }catch{
            return false
        }
    }
    
    
    //Populate alter function
    func populateAlertBox(title:String,message:String){
        
        //Popup alert
        let alert = UIAlertController(title: title, message:message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler:{action in self.signOut()})
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    //Load data from firebase
    func loadFriendsData(){
//        var tempFriendList: [Friend] = []
        Database.database().reference().child("Friends").observe(.childAdded, with: {(snapshot) in
        
            if let dictionary = snapshot.value as? [String:AnyObject]{
                let firstname = dictionary["firstname"] as! String
                let lastname = dictionary["lastname"] as! String
                let profileimageurl = dictionary["imageurl"] as! String
                let phonenumber = dictionary["phonenumber"] as! String
                let fburl = dictionary["fburl"] as! String
                let city = dictionary["city"] as! String
                
                let friend = Friend(firstName: firstname,lastName: lastname,profileImageURL: profileimageurl,phoneNumber: [phonenumber],fbProfileURL: fburl,city: city)
                print(firstname , lastname , profileimageurl)
                self.friends.append(friend)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        })
    }
}
