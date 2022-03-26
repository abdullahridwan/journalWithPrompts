//
//  ContentView.swift
//  Journal
//
//  Created by Abdullah Ridwan on 3/25/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var nvm: NoteViewModel = NoteViewModel()
    @State private var selection: NoteModel? = nil

    var body: some View {
        NavigationView {
            
            List {
                ForEach(0..<nvm.allNotes.count, id: \.self){index in
                    let aNote = $nvm.allNotes[index]
                    
                    NavigationLink(destination: {
                            SingleNote(singleNote: aNote)
                        }, label: {
                            Text(nvm.allNotes[index].prompt)
                        }
                    )
                    
                }
            }
            .onDeleteCommand(perform: { deleteNote() })
            .toolbar(content: {
                
                // Add Item
                ToolbarItem(placement: .navigation, content: {
                    Button(action: {}, label: {
                        Image(systemName: "plus")
                    })
                })
                
                // Delete Item
                ToolbarItem(placement: .primaryAction, content: {
                    Button(action: {
                        deleteNote()
                    }, label: {
                        Label("Delete", systemImage: "trash")
                        .foregroundColor(.red)
                    })
                    .keyboardShortcut(.delete, modifiers: [])
                })
                
            })
            
        }
    }
    
    func deleteNote(){
        if let selection = self.selection,
           let selectionIndex = nvm.allNotes.firstIndex(of: selection){
            nvm.allNotes.remove(at: selectionIndex)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
