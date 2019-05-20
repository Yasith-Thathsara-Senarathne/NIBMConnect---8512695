//
//  Friend.swift
//  NIBMConnect
//
//  Created by Yasith Thathsara Senarathne on 5/19/19.
//  Copyright © 2019 Yasith Thathsara Senarathne. All rights reserved.
//

import Foundation

class Friend{
    
    //Declare Variables
    var firstName:String = ""
    var lastName:String = ""
    var profileImageURL:String = ""
    var phoneNumber:[String] = []
    var fbProfileURL:String = ""
    var city:String = ""
    
   
   //Init variables with params
    init(firstName:String,lastName:String,profileImageURL:String,phoneNumber:[String],fbProfileURL:String,city:String) {
        self.firstName = firstName
        self.lastName = lastName
        self.profileImageURL = profileImageURL
        self.phoneNumber = phoneNumber
        self.fbProfileURL = fbProfileURL
        self.city = city
    }
    
}
