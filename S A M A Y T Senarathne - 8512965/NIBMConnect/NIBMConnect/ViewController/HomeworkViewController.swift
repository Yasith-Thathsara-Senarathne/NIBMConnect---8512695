//
//  HomeworkViewController.swift
//  NIBMConnect
//
//  Created by Yasith Thathsara Senarathne on 5/19/19.
//  Copyright © 2019 Yasith Thathsara Senarathne. All rights reserved.
//

import UIKit

class HomeworkViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var noteList:[String] = []
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
        return self.noteList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var note:String = ""
        note = self.noteList[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "noteListCell" ,for: indexPath) as! NoteTableViewCell

        //Set data to cellview attributes
        cell.setNotes(note: note)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.noteList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
            self.defaults.set(self.noteList, forKey: "savedNotes")
        }
    }
}
