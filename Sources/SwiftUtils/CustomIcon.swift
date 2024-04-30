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
    public init(color: Color, backgroundColor: Color, type: Font.Weight) {
            self.color = color
            self.backgroundColor = backgroundColor
            self.type = type
        }
    static let defaultStyle = IconStyle(color: .black, backgroundColor: .clear, type: .regular)
}
public enum SFSymbol: String {
    case lighteningBolt = "bolt.fill"
    case star = "star.fill"
    case heart = "heart.fill"
    case window = "window"
    case annotation = "annotation"
    // Add all the SF Symbols you need

    var image: Image {
        Image(self.rawValue, bundle: .module)
    }
}
public struct CustomIcon: View {
    public let icon: SFSymbol
       public let style: IconStyle
       public let id: String
    public init(icon: SFSymbol, style: IconStyle, id: String) {
           self.icon = icon
           self.style = style
           self.id = id
       }
    public var body: some View {
        icon.image // Assuming you use SPM's default resource bundle
               .foregroundColor(style.color)
               .font(.system(size: 24, weight: style.type))
               .background(style.backgroundColor)
               .accessibilityLabel(Text(id))
       }
}

// This will be useful for previews in Xcode
#if DEBUG
struct CustomIcon_Previews: PreviewProvider {
    static var previews: some View {
        CustomIcon(icon: .window, style: .defaultStyle , id : "Icon")
    }
}
#endif
