//
//  Translucency.swift
//  journal.io
//
//  Created by Rahul Yedida on 2/14/21.
//

import Foundation
import SwiftUI
import AppKit

extension View {
    func translucent() -> some View {
        return background(TranslucentView())
    }
    
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}

struct TranslucentView: NSViewRepresentable {
    func makeNSView(context: Context) -> some NSView {
        let view = NSVisualEffectView()
        view.blendingMode = .behindWindow
        view.material = .sidebar
        view.state = .active
        view.alphaValue = 0.5
        
        return view
    }
    
    func updateNSView(_ nsView: NSViewType, context: Context) {
        
    }
    
    
}
