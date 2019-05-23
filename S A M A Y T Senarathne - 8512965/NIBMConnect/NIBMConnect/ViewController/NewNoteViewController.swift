//
//  NewNoteViewController.swift
//  NIBMConnect
//
//  Created by Yasith Thathsara Senarathne on 5/22/19.
//  Copyright © 2019 Yasith Thathsara Senarathne. All rights reserved.
//

import UIKit

class NewNoteViewController: UIViewController {
    
    @IBOutlet weak var newNoteTxt: UITextView!
    var noteList:[String] = []
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newNoteTxt.placeholderText = "Type..."
        noteList = defaults.object(forKey: "savedNotes") as? [String] ?? [String]()
    }
    
    
    @IBAction func backBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func saveNewNoteBtn(_ sender: UIButton) {
        
        noteList.append(newNoteTxt.text)
        defaults.set(self.noteList, forKey: "savedNotes")
        self.dismiss(animated: true, completion: nil)
    }
    
}
