//
//  MyProfileViewController.swift
//  NIBMConnect
//
//  Created by Yasith Thathsara Senarathne on 5/19/19.
//  Copyright © 2019 Yasith Thathsara Senarathne. All rights reserved.
//

import UIKit
import LocalAuthentication
import Firebase
import Kingfisher

class MyProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileNameTxt: UILabel!
    @IBOutlet weak var ageTxt: UILabel!
    @IBOutlet weak var birthDateTxt: UILabel!
    @IBOutlet weak var phoneNumberTxt: UILabel!
    @IBOutlet weak var unAuthorizedView: UIView!
    
    let defaults = UserDefaults.standard
    var isAuthorised:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.unAuthorizedView.alpha = 1
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.unAuthorizedView.alpha = 1
        authenticationFingerPrint()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.unAuthorizedView.alpha = 1
    }
    
    //Load data from firebase
    func loadUserData(){
        //        var tempFriendList: [Friend] = []
        Database.database().reference().child("MyAccount").observeSingleEvent(of: .value, with: {( snapshot ) in
            
            if let dictionary = snapshot.value as?  NSDictionary{
                let firstname = dictionary["firstname"] as! String
                let lastname = dictionary["lastname"] as! String
                let profileimageurl = dictionary["imageurl"] as! String
                let phonenumber = dictionary["phonenumber"] as! String
                let age = dictionary["age"] as! Int
                let birthdate = dictionary["birthdate"] as! String
                
                print(firstname)
                
                let url = URL(string:profileimageurl)
                self.profileImage.kf.indicatorType = .activity
                let processor = RoundCornerImageProcessor(cornerRadius: 20)
                self.profileImage.kf.setImage(with: url , options:[.processor(processor)])
                let profileName = "\(firstname) \(lastname)"
                print(profileName)
                self.profileNameTxt.text = "\(firstname) \(lastname)"
                self.ageTxt.text = age.description
                self.phoneNumberTxt.text = phonenumber
                self.birthDateTxt.text = birthdate
                
                self.roundUpImage()
            }
            else{
                print("No values")
            }
        })
    }
    
    //Authentication fingerprint function
    func authenticationFingerPrint(){
        let authContext = LAContext()
        let authReason = "Please use Touch ID to access Your Account"
        var authError : NSError?
        
        if authContext.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &authError){
            
            authContext.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: authReason, reply: { (success,error) -> Void in
                if success{
                    print("Authentication Success")
                    DispatchQueue.main.async{
                        self.loadUserData()
                        self.unAuthorizedView.alpha = 0
                    }
                }
                if error != nil{
                    self.populateAlertBox(title: "Touch ID Error", message: (error?.localizedDescription)!)
                }
            })
        }
        else{
            populateAlertBox(title: "Touch ID Error", message: (authError?.localizedDescription)!)
            print(authError?.localizedDescription)
        }
    }
    
    //Populate alter function
    func populateAlertBox(title:String,message:String){
        
        //Popup alert
        let alert = UIAlertController(title: title, message:message, preferredStyle: .alert)
        let action = UIAlertAction(title:"Ok", style: .default, handler:{action in self.showError()})
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    //Error show function
    func showError(){
        self.unAuthorizedView.alpha = 1
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
