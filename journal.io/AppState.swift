//
//  AppState.swift
//  journal.io
//
//  Created by Rahul Yedida on 2/4/21.
//

import Foundation

struct AppState {
    // What entry is currently being viewed or edited
    var currentlyOpenEntry: String
    
    // Are we editing?
    var editingMode: Bool
}

var globalState: AppState = AppState(
    currentlyOpenEntry: "New Entry",
    editingMode: false
)
