//
//  File.swift
//  
//
//  Created by Ketan Shingade on 29/04/24.
//

import Foundation
import SwiftUI

public struct IconStyle {
    public var color: Color
        public var backgroundColor: Color
        public var type: Font.Weight
    public var size: CGFloat
    public init(color: Color, backgroundColor: Color, type: Font.Weight, size: CGFloat = 24) {
            self.color = color
            self.backgroundColor = backgroundColor
            self.type = type
        self.size = size
        }
    static let defaultStyle = IconStyle(color: .black, backgroundColor: .clear, type: .regular, size: 24)
}
public enum Icons: String {
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

    // Custom icons
    case window = "window"
    case annotation = "annotation"
    case highestPriority = "highestPriority"
    

    // Determine if an icon is custom
    private var isCustom: Bool {
        switch self {
        case .window, .annotation , .highestPriority :
            return true
        default:
            return false
        }
    }

    // Simplified image property using raw values
    var image: Image {
        if isCustom {
            // Load custom icons from the package's resources
            return Image(self.rawValue, bundle: .module)
        } else {
            // Load system icons using their SF Symbol names
            return Image(systemName: self.rawValue)
        }
    }
}
public struct CustomIcon: View {
    public let icon: Icons
       public let style: IconStyle
       public let id: String
    public init(icon: Icons, style: IconStyle, id: String) {
           self.icon = icon
           self.style = style
           self.id = id
       }
    public var body: some View {
        icon.image // Assuming you use SPM's default resource bundle
               .foregroundColor(style.color)
               .font(.system(size: style.size, weight: style.type))
               .background(style.backgroundColor)
               .accessibilityLabel(Text(id))
       }
}

// This will be useful for previews in Xcode
#if DEBUG
struct CustomIcon_Previews: PreviewProvider {
    static var previews: some View {
        CustomIcon(icon: .lighteningBolt, style: .defaultStyle , id : "Icon")
    }
}
#endif
