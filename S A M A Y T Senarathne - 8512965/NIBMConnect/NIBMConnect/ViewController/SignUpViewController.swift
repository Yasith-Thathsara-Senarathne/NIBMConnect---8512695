//
//  SignUpViewController.swift
//  NIBMConnect
//
//  Created by Yasith Thathsara Senarathne on 5/18/19.
//  Copyright © 2019 Yasith Thathsara Senarathne. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var imageLoadBtn: UIButton!
    @IBOutlet weak var firstNameTxt: UITextField!
    @IBOutlet weak var lastNameTxt: UITextField!
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var cityTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var passwordReTypeTxt: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var loadingView: UIView!
    
    let ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func registerUser(_ sender: UIButton) {
        
        if (firstNameTxt.text?.isEmpty)!{
            self.populateAlertBox(title: "Empty Fields !", message: "Enter Firstname")
            return
        }
        else if (lastNameTxt.text?.isEmpty)!{
            self.populateAlertBox(title: "Empty Fields !", message: "Enter Lastname")
            return
        }
        else if (userNameTxt.text?.isEmpty)!{
            self.populateAlertBox(title: "Empty Fields !", message: "Enter Username")
            return
        }
        else if (emailTxt.text?.isEmpty)!{
            self.populateAlertBox(title: "Empty Fields !", message: "Enter Email")
            return
        }
        else if (cityTxt.text?.isEmpty)!{
            self.populateAlertBox(title: "Empty Fields !", message: "Enter City")
            return
        }
        else if (passwordTxt.text?.isEmpty)!{
            self.populateAlertBox(title: "Empty Fields !", message: "Enter Password")
            return
        }
        else if (passwordReTypeTxt.text?.isEmpty)!{
            self.populateAlertBox(title: "Empty Fields !", message: "Enter Password Retype")
            return
        }
        else if passwordTxt.text != passwordReTypeTxt.text{
            self.populateAlertBox(title: "Missmatch !", message: "Password & Password Retype missmatch")
            return
        }
        else{
            
            self.loadingView.alpha = CGFloat(1)
            
            let firstName = firstNameTxt.text
            let lastName = lastNameTxt.text
            let userName = userNameTxt.text
            let email = emailTxt.text
            let password = passwordTxt.text
            let city = cityTxt.text
            
            Auth.auth().createUser(withEmail: email!, password: password!) { (user, error) in
                if error != nil{
                    self.loadingView.alpha = CGFloat(0)
                    self.populateAlertBox(title: "Signup Error", message: (error?.localizedDescription)!)
                }
                guard let uid = user?.user.uid else{
                    return
                }
                
                let userRef = self.ref.child("myAccount").child(uid)
                let values = [
                    "email":email,
                    "firstname":firstName,
                    "lastname":lastName,
                    "username":userName,
                    "city":city
                    ]
                userRef.updateChildValues(values, withCompletionBlock: { (error, ref) in
                    if error != nil{
                        self.loadingView.alpha = CGFloat(0)
                        self.populateAlertBox(title: "User Detail Update Error", message: (error?.localizedDescription)!)
                    }
                    
                    self.dismiss(animated: true, completion: nil)
                    self.loadingView.alpha = CGFloat(0)
                    let storyboard = UIStoryboard(name: "Home", bundle: nil)
                    let controller = storyboard.instantiateViewController(withIdentifier: "Home") as! HomeViewController
                    self.present(controller, animated: true, completion: nil)
                })
            }
        }
    }
    
    //Populate alter function
    func populateAlertBox(title:String,message:String){
        
        //Popup alert
        let alert = UIAlertController(title: title, message:message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
}
