//
//  TabBarViewController.swift
//  NIBMConnect
//
//  Created by Yasith Thathsara Senarathne on 5/19/19.
//  Copyright © 2019 Yasith Thathsara Senarathne. All rights reserved.
//

import UIKit
import LocalAuthentication

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
  
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.delegate = self
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 2{
            
        }
    }
    
    //Authentication fingerprint function
    func authenticationFingerPrint(){
        let authContext = LAContext()
        let authReason = "Please use Touch ID to access Your Account"
        var authError : NSError?
        
        if authContext.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &authError){
            
            authContext.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: authReason, reply: { (success,error) -> Void in
                if success{
                    //Go to My Account Page
                    print("Authentication Success")
                    self.defaults.set(true, forKey: "isAuthorized")
                    self.selectedIndex = 2
                }
                
                if error != nil{
                    self.defaults.set(false, forKey: "isAuthorized")
                    self.populateAlertBox(title: "Touch ID Error", message: (error?.localizedDescription)!)
                }
                
            })
            
        }
        else{
            self.defaults.set(false, forKey: "isAuthorized")
            populateAlertBox(title: "Touch ID Error", message: (authError?.localizedDescription)!)
            print(authError?.localizedDescription)
        }
    }
    
    //Populate alter function
    func populateAlertBox(title:String,message:String){
        
        //Popup alert
        let alert = UIAlertController(title: title, message:message, preferredStyle: .alert)
        let action = UIAlertAction(title:"Ok", style: .default, handler:{action in self.goToHomeTabHandler()})
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    //Alert action handler function
    func goToHomeTabHandler(){
        self.defaults.set(false, forKey: "isAuthorized")
        self.selectedIndex = 0
        self.selectedIndex = 0
        self.selectedIndex = 0
        self.selectedIndex = 0
    }
}
