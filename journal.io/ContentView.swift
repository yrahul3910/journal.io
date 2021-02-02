//
//  ContentView.swift
//  journal.io
//
//  Created by Rahul Yedida on 2/2/21.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: journal_ioDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(journal_ioDocument()))
    }
}
