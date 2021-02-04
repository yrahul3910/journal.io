//
//  ContentView.swift
//  journal.io
//
//  Created by Rahul Yedida on 2/2/21.
//

import SwiftUI
import Foundation

struct ContentView: View {
    @Binding var document: journal_ioDocument
    
    // Move to an editing state for a new entry
    func createNewEntry() {
        // If we're editing, do nothing
        if (globalState.editingMode) {
            return
        }
        
        // Otherwise, go to edit mode
        globalState.editingMode = true
        globalState.currentlyOpenEntry = Date().description
    }
    
    // Remove the clicked attachment
    // TODO: Implement an overlay on hovering
    func removeAttachment(data: Data) {
        document.attachments.remove(at:
            document.attachments.firstIndex(of: data)!
        )
    }
    
    // Add an attachment to the current entry
    func addAttachment() {
        
    }
    
    var body: some View {
        HStack {
            VStack {
                Text("Your Entries")
                    .font(.title)
                    .bold()
                    .padding()
                Spacer()
            }
            VStack {
                HStack {
                    Text(globalState.currentlyOpenEntry)
                        .font(.title)
                        .padding()
                    Spacer()
                    Button(action: self.createNewEntry) {
                        Image(systemName: "plus")
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding()
                }
                HStack {
                    ForEach(document.attachments, id: \.self, content: { data in
                        Button(action: {  self.removeAttachment(data: data) }) {
                            Image(nsImage: NSImage(data: data)!)
                                .frame(width: 100, height: 100, alignment: .center)
                        }
                        .buttonStyle(PlainButtonStyle())
                    })
                    Button(action: self.addAttachment) {
                        Image(systemName: "plus")
                            .frame(width: 100, height: 100, alignment: .center)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    Spacer()
                }.padding()
                TextEditor(text: $document.currentText)
                    .font(.body)
                    .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let doc = journal_ioDocument()
        ContentView(document: .constant(doc))
    }
}
