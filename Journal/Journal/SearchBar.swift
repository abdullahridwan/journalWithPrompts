//
//  SearchBar.swift
//  Journal
//
//  Created by Abdullah Ridwan on 3/25/22.
//

import SwiftUI

struct SearchBar: View {
    @State var notes: [String] = ["Holly", "Josh", "Rhonda", "Ted"]
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            List {
                ForEach($notes, id: \.self) { $aNote in
                    NavigationLink(destination: TextField("Un", text: $aNote)) {
                        TextField("Un", text: $aNote)
                    }
                }
            }
            .searchable(text: $searchText) {
                ForEach(searchResults, id: \.self) { result in
                    Text("\(result)").searchCompletion(result)
                }
            }
            .navigationTitle("Contacts")
        }
    }

    var searchResults: [String] {
        if searchText.isEmpty {
            return notes
        } else {
            return notes.filter { $0.contains(searchText) }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
