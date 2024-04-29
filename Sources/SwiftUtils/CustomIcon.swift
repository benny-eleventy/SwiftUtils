//
//  File.swift
//  
//
//  Created by Ketan Shingade on 29/04/24.
//

import Foundation
import SwiftUI

struct IconStyle {
    var color: Color
    var backgroundColor: Color
    var type: Font.Weight

    // You might want to define default styles or static presets here
    static let defaultStyle = IconStyle(color: .black, backgroundColor: .clear, type: .regular)
}

struct CustomIcon: View {
    let icon: String
    let style: IconStyle
    let id:String

    var body: some View {
        Image(icon, bundle: .myIconsModule) // Make sure that the bundle identifier is correctly set up
            .foregroundColor(style.color)
            .font(.system(size: 24, weight: style.type))
            .background(style.backgroundColor)
            .accessibilityLabel(Text(id)) // Replace with appropriate description
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
