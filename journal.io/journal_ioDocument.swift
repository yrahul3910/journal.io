//
//  journal_ioDocument.swift
//  journal.io
//
//  Created by Rahul Yedida on 2/2/21.
//

import SwiftUI
import UniformTypeIdentifiers

extension UTType {
    static var journal: UTType {
        UTType(exportedAs: "com.journal-io.journal")
    }
}

struct journal_ioDocument: FileDocument {
    var journal: Journal
    
    // For new entry
    var currentText: String = ""
    var attachments: [Data] = []
    
    init(contents: [JournalEntry] = []) {
        journal = Journal(entries: contents)
    }
    
    static var readableContentTypes: [UTType] { [.journal] }
    
    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents else {
            throw CocoaError(.fileReadCorruptFile)
        }
        
        journal = try JSONDecoder().decode(Journal.self, from: data)
    }
    
    func fileWrapper(configuration: WriteConfiguration) -> FileWrapper {
        do {
            let data = try JSONEncoder().encode(journal)
            return .init(regularFileWithContents: data)
        } catch {
            print(error.localizedDescription)
            return .init(regularFileWithContents: "".data(using: .utf8)!)
        }
    }
}
