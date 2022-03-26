//
//  SingleNote.swift
//  Journal
//
//  Created by Abdullah Ridwan on 3/26/22.
//

import SwiftUI

struct SingleNote: View {
    @Binding var singleNote: NoteModel
    @State var something: Bool = true
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading){
                Text(dateToString(date: singleNote.noteDate))
                    .font(.title)
                    .fontWeight(.medium)
                Prompt(singleNote: $singleNote)
                VStack {
                    TextEditor(text: $singleNote.content)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.all, 5)
                }
                .overlay(
                         RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.black.opacity(0.2), lineWidth: 0.5)
                         )
            }
            .padding()
        }
    }
    
    
    
    
    
    
    
    func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EE, MMMM dd, YYYY"
        formatter.timeZone = TimeZone.current
        formatter.calendar = Calendar.current

        return formatter.string(from: date)
    }
            
}

struct SingleNote_Previews: PreviewProvider {
    static var previews: some View {
        SingleNote(singleNote: .constant(NoteModel(noteDate: Date(), completed: false, prompt: "Why is the sky blue?", content: "")))
    }
}

struct Prompt: View {
    @Binding var singleNote: NoteModel
    var body: some View {
        HStack{
            TextField("\(singleNote.prompt)", text: Binding(
                get: { singleNote.prompt },
                set: { singleNote.prompt = $0 }
            ))
                .textFieldStyle(PlainTextFieldStyle())
                .foregroundColor(Color.gray)
                .font(.title3)
        }
    }
}
