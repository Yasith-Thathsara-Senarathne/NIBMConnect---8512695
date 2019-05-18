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

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
//    //Sign up function
//    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
//        print("Google Sing In didSignInForUser")
//        if let error = error {
//            print(error.localizedDescription)
//            return
//        }
//        guard let authentication = user.authentication else { return }
//        let credential = GoogleAuthProvider.credential(withIDToken: (authentication.idToken)!, accessToken: (authentication.accessToken)!)
//        // When user is signed in
//        Auth.auth().signIn(with: credential, completion: { (user, error) in
//            if let error = error
//            {
//                //Popup alert
//                print("Login error: \(error.localizedDescription)")
//                let alert = UIAlertController(title: "Sign In Error !", message:error.localizedDescription, preferredStyle: .alert)
//
//                alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
//
//                self.present(alert, animated: true)
//                return
//            }
//
//            //perfome Sague
//
//
//        })
//    }
}
