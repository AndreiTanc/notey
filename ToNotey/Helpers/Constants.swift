//
//  Constants.swift
//  ToNotey
//
//  Created by Andrei Tanc on 21.11.2022.
//

import Foundation
import UIKit

struct Constants {
    
    static var isDarkMode: Bool {
        get {
            UITraitCollection.current.userInterfaceStyle == .dark
        }
    }
    
}
