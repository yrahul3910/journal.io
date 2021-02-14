//
//  DropDelegate.swift
//  journal.io
//
//  Created by Rahul Yedida on 2/13/21.
//  From https://swiftwithmajid.com/2020/04/01/drag-and-drop-in-swiftui/

import Foundation
import SwiftUI

struct ImageDropDelegate: DropDelegate {
    @Binding var images: [Data]

    func performDrop(info: DropInfo) -> Bool {
        guard info.hasItemsConforming(to: [.image, .png, .jpeg]) else {
            return false
        }

        let items = info.itemProviders(for: [.image, .jpeg, .png])
        for item in items {
            _ = item.loadDataRepresentation(forTypeIdentifier: kUTTypeImage as String, completionHandler: { img, _ in
                if let img = img {
                    DispatchQueue.main.async {
                        self.images.append(img)
                    }
                }
            })
        }

        return true
    }
}

