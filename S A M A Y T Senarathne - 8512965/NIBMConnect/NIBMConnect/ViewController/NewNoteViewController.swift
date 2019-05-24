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
        
        if (newNoteTxt.text?.isEmpty)!{
            self.populateAlertBox(title: "Empty Fields !", message: "Enter Email")
            return
        }
        
        noteList.append(newNoteTxt.text)
        defaults.set(self.noteList, forKey: "savedNotes")
        self.populateAlertBox(title: "Saved", message: "Note saved successfully")
    }
    
    //Populate alter function
    func populateAlertBox(title:String,message:String){
        
        //Popup alert
        let alert = UIAlertController(title: title, message:message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: {action in self.dismissView()})
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    //Dismiss view
    func dismissView(){
        self.dismiss(animated: true, completion: nil)
    }
    
}
