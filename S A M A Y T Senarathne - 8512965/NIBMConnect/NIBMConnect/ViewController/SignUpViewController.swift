//
//  SignUpViewController.swift
//  NIBMConnect
//
//  Created by Yasith Thathsara Senarathne on 5/18/19.
//  Copyright © 2019 Yasith Thathsara Senarathne. All rights reserved.
//

import UIKit

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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    }
    
    //Populate alter function
    func populateAlertBox(title:String,message:String){
        
        //Popup alert
        let alert = UIAlertController(title: title, message:message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
}
