//
//  NoteController.swift
//  QuickNotes
//
//  Created by Welinkton on 8/29/18.
//  Copyright © 2018 Jerrick Warren. All rights reserved.
//

import Foundation

// Handle the interactions with the model
class NoteController {
    
    // CRUD
    
    //Create
    func createNote(with text: String){
        
        let note = Note(text: text)
        
        notes.append(note)
        
    }
    
    // Delete
    
    func delete(note: Note) {
        
        guard let index = notes.index(of: note) else {return}
        
        notes.remove(at: index)
        
    }
    
    //Read
    // this is where you handle ANY implentation of our notes
    // this the source of data for the entire App
    // We are going to add notes to the array
    private(set) var notes: [Note] = []
    
}
