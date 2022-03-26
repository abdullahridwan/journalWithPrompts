//
//  NoteViewModel.swift
//  Journal
//
//  Created by Abdullah Ridwan on 3/26/22.
//

import Foundation
import SwiftUI


struct NoteModel: Hashable {
    var noteDate: Date
    var completed: Bool
    var prompt: String
    var content: String
}

class NoteViewModel: ObservableObject{
    @Published var allNotes: [NoteModel]
    
    init(){
        allNotes = [
            NoteModel(noteDate: Date(), completed: true, prompt: "prompt 1", content: "na"),
            NoteModel(noteDate: Date(), completed: false, prompt: "prompt 2", content: "ba")
        ]
    }
    
    
}
