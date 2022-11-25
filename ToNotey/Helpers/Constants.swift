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

typealias KeyConstants = Constants
extension KeyConstants {
    enum ToDo: String {
        case title = "title"
        case isHighPriority = "isHighPriority"
        case isDone = "isDone"
        case details = "details"
        case recordingURL = "recordingURL"
        case shouldWarn = "shouldWarn"
        case date = "date"
        case completingDate = "completingDate"
    }
}

