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
    
    @State var showHover: [Bool] = []
        
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
    func removeAttachment(index: Int) {
        document.attachments.remove(at: index)
    }
    
    var body: some View {
        return HStack {
            VStack {
                Text("Your Entries")
                    .font(.title)
                    .bold()
                    .padding()
                Spacer()
            }.translucent()
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
                    List {
                        ForEach(document.attachments.indices, id: \.self, content: { index in
                            Button(action: {  self.removeAttachment(index: index) }) {
                                Image(nsImage: NSImage(data: document.attachments[index])!)
                                    .resizable()
                                    .frame(width: 100, height: 100, alignment: .center)
                                    .aspectRatio(1, contentMode: .fill)
                            }
                            .overlay(Color.init(.sRGB, red: 1, green: 0, blue: 0, opacity: 0.4)
                                        .translucent()
                                        .overlay(
                                            Image(systemName: "minus.circle.fill")
                                                .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        )
                                        .isHidden(!self.showHover[index], remove: !self.showHover[index]))
                            .buttonStyle(PlainButtonStyle())
                            .onHover(perform: { hovering in
                                self.showHover[index] = hovering
                            })
                            
                        })
                    }
                    .onDrop(of: [.image], delegate: ImageDropDelegate(images: $document.attachments, indices: $showHover))
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
