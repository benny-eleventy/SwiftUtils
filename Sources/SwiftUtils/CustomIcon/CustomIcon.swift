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
               .font(Font.system(size: style.size, weight: type))
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
