//
//  HomeViewController.swift
//  NIBMConnect
//
//  Created by Yasith Thathsara Senarathne on 5/18/19.
//  Copyright © 2019 Yasith Thathsara Senarathne. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.roundImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func roundImage(){
        profileImage.layer.borderWidth = 1
        profileImage.layer.masksToBounds = false
        profileImage.layer.borderColor = UIColor.black.cgColor
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.clipsToBounds = true
    }

}
