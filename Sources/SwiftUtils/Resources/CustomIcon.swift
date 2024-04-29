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

public struct CustomIcon: View {
    public let icon: String
       public let style: IconStyle
       public let id: String
    public init(icon: String, style: IconStyle, id: String) {
           self.icon = icon
           self.style = style
           self.id = id
       }
    public var body: some View {
           Image(icon, bundle: .module) // Assuming you use SPM's default resource bundle
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
        CustomIcon(icon: "window", style: .defaultStyle , id : "Icon")
    }
}
#endif
