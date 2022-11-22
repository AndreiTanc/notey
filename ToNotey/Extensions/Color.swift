//
//  Color.swift
//  ToNotey
//
//  Created by Andrei Tanc on 22.11.2022.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let primary = Color("Primary")
    let secondary = Color("Secondary")
    let blue = Color("Blue")
    let primaryInversed = Color("PrimaryInversed")
}
