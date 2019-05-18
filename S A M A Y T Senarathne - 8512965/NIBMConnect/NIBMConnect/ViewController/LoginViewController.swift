//
//  LoginViewController.swift
//  NIBMConnect
//
//  Created by Yasith Thathsara Senarathne on 5/17/19.
//  Copyright © 2019 Yasith Thathsara Senarathne. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    @IBOutlet weak var loadingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //loginUser button click
    @IBAction func loginUserAction(_ sender: UIButton) {
        
        self.loadingView.alpha = CGFloat(1.0)
        if (emailTxt.text?.isEmpty)!{
            self.populateAlertBox(title: "Empty Fields !", message: "Enter Email")
            self.loadingView.alpha = CGFloat(0.0)
            return
        }
        else if (passwordTxt.text?.isEmpty)!{
            self.populateAlertBox(title: "Empty Fields !", message: "Enter Password")
            self.loadingView.alpha = CGFloat(0.0)
            return
        }
        else{
        
            Auth.auth().signIn(withEmail: self.emailTxt.text!, password: self.passwordTxt.text!) { [weak self] user, error in
                guard let strongSelf = self else { return }
                if error != nil {
                    let alert = UIAlertController(title: "Login Error", message: error?.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    strongSelf.loadingView.alpha = CGFloat(0.0)
                    strongSelf.present(alert, animated: true, completion: nil)
                } else {
                    strongSelf.dismiss(animated: true, completion: nil)
                    strongSelf.loadingView.alpha = CGFloat(0.0)
                    let storyboard = UIStoryboard(name: "Home", bundle: nil)
                    let controller = storyboard.instantiateViewController(withIdentifier: "Home") as! HomeViewController
                    strongSelf.present(controller, animated: true, completion: nil)
                }
            }
        }
    }
    //End
    
    //Populate alter function
    func populateAlertBox(title:String,message:String){
        
        //Popup alert
        let alert = UIAlertController(title: title, message:message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}
