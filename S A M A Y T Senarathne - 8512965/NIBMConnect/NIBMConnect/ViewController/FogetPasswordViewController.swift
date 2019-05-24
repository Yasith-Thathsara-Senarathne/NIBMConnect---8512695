//
//  FogetPasswordViewController.swift
//  NIBMConnect
//
//  Created by Yasith Thathsara Senarathne on 5/20/19.
//  Copyright © 2019 Yasith Thathsara Senarathne. All rights reserved.
//

import UIKit
import Firebase

class FogetPasswordViewController: UIViewController {

    
    @IBOutlet weak var newPasswordTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var loadingView: UIView!
    
    private lazy var currentUser: User? = {
        return Auth.auth().currentUser
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Reset password Btn click
    @IBAction func passwordResetBtn(_ sender: UIButton) {
        
        self.loadingView.alpha = CGFloat(1.0)
        
        if (emailTxt.text?.isEmpty)!{
            self.loadingView.alpha = CGFloat(0.0)
            self.populateAlertBox(title: "Empty Fields !", message: "Enter Email")
            return
        }
        else if (currentUser?.email != emailTxt.text){
            self.loadingView.alpha = CGFloat(0.0)
            self.populateAlertBox(title: "Mismatch", message: "Email Does Not Match")
            return
        }
        else{
            //reset password
            let resetEmail = self.emailTxt.text!
            Auth.auth().sendPasswordReset(withEmail: resetEmail, completion: { (error) in
                //Make sure you execute the following code on the main queue
                DispatchQueue.main.async {
                    //Use "if let" to access the error, if it is non-nil
                    if let error = error {
                        self.loadingView.alpha = CGFloat(0.0)
                        self.populateAlertBox(title: "Password Reset Error", message: error.localizedDescription)
                        return
                    } else {
                        self.loadingView.alpha = CGFloat(0.0)
                        self.populateSuccessAlertBox(title: "Reset Email Sent Successfully", message: "Check your email")
                    }
                }
            })
        }
    }
    
    //Password reset Ok Handler function
    func passwordRestDone(){
        print("Clicked")
        self.navigationController?.popViewController(animated: true)
    }
    
    //Populate alter function
    func populateAlertBox(title:String,message:String){
        
        //Popup alert
        let alert = UIAlertController(title: title, message:message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    //Populate success alter function
    func populateSuccessAlertBox(title:String,message:String){
        
        //Popup alert
        let alert = UIAlertController(title: title, message:message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: {action in self.passwordRestDone()})
        alert.addAction(action)
        self.present(alert, animated: true)
    }
}

