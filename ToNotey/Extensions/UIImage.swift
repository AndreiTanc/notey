//
//  UIImage.swift
//  ToNotey
//
//  Created by Andrei Tanc on 21.11.2022.
//

import Foundation

fileprivate let kBackground = "background"
fileprivate let kCover = "cover"

fileprivate let kDark = "Dark"
fileprivate let kLight = "Light"

extension UIImage {
    var backgroundImage: UIImage {
        get {
            let imageName = kBackground + Constants.isDarkMode ? kDark : kLight
            return UIImage(named: imageName)
        }
    }
    
    var coverImage: UIImage {
        get {
            let imageName = kCover + Constants.isDarkMode ? kDark : kLight
            return UIImage(named: imageName)
        }
    }
}
