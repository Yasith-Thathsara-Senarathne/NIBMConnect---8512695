//
//  HomeworkViewController.swift
//  NIBMConnect
//
//  Created by Yasith Thathsara Senarathne on 5/19/19.
//  Copyright © 2019 Yasith Thathsara Senarathne. All rights reserved.
//

import UIKit

class HomeworkViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var noteList:[String] = []
    @IBOutlet weak var tableView: UITableView!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.rowHeight = 70
        noteList = defaults.object(forKey: "savedNotes") as? [String] ?? [String]()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        noteList = defaults.object(forKey: "savedNotes") as? [String] ?? [String]()
        print(noteList.count)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(noteList[0])
        return self.noteList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var note:String = ""
        note = self.noteList[indexPath.row]
        print("note",self.noteList[indexPath.row])

        let cell = tableView.dequeueReusableCell(withIdentifier: "noteListCell" ,for: indexPath) as! NoteTableViewCell

        //Set data to cellview attributes
        cell.setNotes(note: note)
        return cell
    }
}
