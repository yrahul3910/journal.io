//
//  journal_ioApp.swift
//  journal.io
//
//  Created by Rahul Yedida on 2/2/21.
//

import SwiftUI

@main
struct journal_ioApp: App {    
    var body: some Scene {
        DocumentGroup(newDocument: journal_ioDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
