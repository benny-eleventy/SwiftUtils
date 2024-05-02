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
        public var size: CGFloat
        public init(color: Color, backgroundColor: Color, size: CGFloat = 24) {
            self.color = color
            self.backgroundColor = backgroundColor
            self.size = size
        }
        static let defaultStyle = IconStyle(color: .black, backgroundColor: .clear, size: 24)
}
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
        

    // Determine if an icon is custom
    private var isCustom: Bool {
        switch self {
        case .window, .annotation , .highestPriority, .mosaic , .bubbles :
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
public struct CustomIcon: View {
    public let icon: IconNames
    public let id: String
    public let type: Font.Weight
    public let style: IconStyle
    
   
    public init(icon: IconNames, id: String, type: Font.Weight, style: IconStyle ) {
           self.icon = icon
        self.id = id
        self.type=type
           self.style = style
        
           
       }
    public var body: some View {
        icon.image // Assuming you use SPM's default resource bundle
               .foregroundColor(style.color)
               .font(.system(size: style.size, weight: type))
               .background(style.backgroundColor)
               .accessibilityLabel(Text(id))
       }

}

// This will be useful for previews in Xcode
#if DEBUG
struct CustomIcon_Previews: PreviewProvider {
    static var previews: some View {
        CustomIcon(icon: .lighteningBolt, id : "Icon",type: .thin , style: .defaultStyle )
    }
}
#endif
