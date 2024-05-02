//
//  File.swift
//  
//
//  Created by Ketan Shingade on 02/05/24.
//

import Foundation
import SwiftUI
public enum IconNames: String {
    // System SF Symbols
        case lighteningBolt = "bolt.fill"
        case star = "star.fill"
        case heart = "heart.fill"
        case magnifyingGlass = "magnifyingglass"
        case envelope = "envelope.fill"
        case gear = "gear"
        case trash = "trash.fill"
        case folder = "folder.fill"
        case paperplane = "paperplane.fill"
        case bookmark = "bookmark.fill"
        case moon = "moon.fill"
        case sunMax = "sun.max.fill"
        case pencil = "pencil"
        case photo = "photo.fill"
        case camera = "camera.fill"

    // Custom icons/ also add in the switch case below
        case window = "window"
        case annotation = "annotation"
        case highestPriority = "highestPriority"
        case mosaic = "mosaic"
        case bubbles = "bubbles"
        case stickyNote = "stickyNote"
        

    // Determine if an icon is custom
    private var isCustom: Bool {
        switch self {
        case .window, .annotation , .highestPriority, .mosaic , .stickyNote , .bubbles :
            return true
        default:
            return false
        }
    }

    // Simplified image property using raw values
    var image: Image {
        if isCustom {
            // Load custom icons from the package's resources
            return Image(self.rawValue, bundle: .myIconsModule)
        } else {
            // Load system icons using their SF Symbol names
            return Image(systemName: self.rawValue)
        }
    }
}
