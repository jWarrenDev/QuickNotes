//
//  NotesTableViewController.swift
//  QuickNotes
//
//  Created by Welinkton on 8/29/18.
//  Copyright © 2018 Jerrick Warren. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController, NoteTableViewCellDelegate {
    
    func shareNote(for cell: NoteTableViewCell) {
        // we can do what ever we want to do
        
        guard let note = cell.note else { return }
        
        let activityController = UIActivityViewController(activityItems: [note.text], applicationActivities: nil)
        
        present(activityController, animated: true, completion: nil)
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return noteController.notes.count
    }

    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath) as? NoteTableViewCell else {return UITableViewCell() }

        // Configure the cell...
        
        // Get an instance of Note from the noteController and pass it to the cell )so that it can display the notes' information
        
    let note = noteController.notes[indexPath.row]
        
        cell.note = note
        cell.delegate = self
        
        return cell
    
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            let note = noteController.notes[indexPath.row]
            
            noteController.delete(note: note)
            
            // Delete cell
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    
}

    @IBOutlet weak var noteTextView: UITextView!
    
    @IBAction func addNote(_ sender: Any) {
    
    guard let text = noteTextView.text else { return }
    
    noteController.createNote(with: text)
    
    tableView.reloadData()
    
    noteTextView.text = ""
    
    
    
    
    }
}
    let noteController = NoteController()
    

