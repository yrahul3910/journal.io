//
//  Journal.swift
//  journal.io
//
//  Created by Rahul Yedida on 2/2/21.
//

import Foundation

struct Content: Codable {
    var type: String
    
    // Do not modify!
    var version: String = "1.0"
    
    // If text
    var text: String?
    
    // If image
    var img: Data?
}

struct JournalEntry: Codable {
    var text: String
    var images: [Data]
    var date: Date
}

struct Journal: Codable {
    var entries: [JournalEntry]
    
    var version: String = "1.0"
}
