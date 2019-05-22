//
//  NoteTableViewCell.swift
//  NIBMConnect
//
//  Created by Yasith Thathsara Senarathne on 5/22/19.
//  Copyright © 2019 Yasith Thathsara Senarathne. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {

    
    @IBOutlet weak var noteTxt: UILabel!
    
    func setNotes(note:String){
        print(note)
        self.noteTxt.text = note
    }
    
    
}
