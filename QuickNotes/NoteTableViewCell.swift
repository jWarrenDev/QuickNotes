//
//  NoteTableViewCell.swift
//  QuickNotes
//
//  Created by Welinkton on 8/29/18.
//  Copyright © 2018 Jerrick Warren. All rights reserved.
//

import UIKit

protocol NoteTableViewCellDelegate: class {
    func shareNote(for cell: NoteTableViewCell)
}

class NoteTableViewCell: UITableViewCell {

    // Create Action buttons shareNote
    @IBAction func shareNote(_ sender: Any) {
    
        delegate?.shareNote(for: self)
    
    }
    
    func updateViews(){
        
        guard let note = note else {return}
        
        noteLabel.text = note.text
        
    }
    
    var note: Note? {
        didSet {
            updateViews()
        }
    }
    
    weak var delegate: NoteTableViewCellDelegate?
    
    @IBOutlet weak var noteLabel: UILabel!
}

