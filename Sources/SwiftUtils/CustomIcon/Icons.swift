//
//  File.swift
//  
//
//  Created by Ketan Shingade on 02/05/24.
//

import Foundation
import SwiftUI
public enum IconNames: String {
    
        case none = "none"
    // System SF Symbols
        case lighteningBolt = "bolt"
        case star = "star"
        case heart = "heart"
        case magnifyingGlass = "magnifyingglass"
        case envelope = "envelope"
        case gear = "gear"
        case trash = "trash"
        case folder = "folder"
        case paperplane = "paperplane"
        case bookmark = "bookmark"
        case moon = "moon"
        case sunMax = "sun.max"
        case pencil = "pencil"
        case photo = "photo"
        case camera = "camera"

    // Custom icons/ also add in the switch case below
        case window = "window"
        case annotation = "annotation"
        case highestPriority = "highestPriority"
        case mosaic = "mosaic"
        case bubbles = "bubbles"
        case stickyNote = "stickyNote"
        case flag="flag"

    // Determine if an icon is custom
    private var isCustom: Bool {
        switch self {
        case .window, .annotation , .highestPriority, .mosaic , .stickyNote , .bubbles,.flag :
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
