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
            self.loadingView.alpha = CGFloat(0.0)
            self.populateAlertBox(title: "Empty Fields !", message: "Enter Email")
            return
        }
        else if (passwordTxt.text?.isEmpty)!{
            self.loadingView.alpha = CGFloat(0.0)
            self.populateAlertBox(title: "Empty Fields !", message: "Enter Password")
            return
        }
        else{
        
            Auth.auth().signIn(withEmail: self.emailTxt.text!, password: self.passwordTxt.text!) { [weak self] user, error in
                guard let strongSelf = self else { return }
                if error != nil {
                    let alert = UIAlertController(title: "Login Error", message: error?.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self?.loadingView.alpha = CGFloat(0.0)
                    strongSelf.present(alert, animated: true, completion: nil)
                } else {
                    strongSelf.dismiss(animated: true, completion: nil)
                    
                    print(user?.user.uid)
                    //Adding user data to AppData
                    AppData.user.uid = (user?.user.uid)!
                    AppData.user.email = (user?.user.email)!
                    
                    //End
                    
                    //Open next UI
                    strongSelf.loadingView.alpha = CGFloat(0.0)
                    let storyboard = UIStoryboard(name: "Home", bundle: nil)
                    let controller = storyboard.instantiateViewController(withIdentifier: "Home") as! TabBarViewController
                    strongSelf.present(controller, animated: true, completion: nil)
                    //End
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

var vSpinner : UIView?

extension UIViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init()
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}
