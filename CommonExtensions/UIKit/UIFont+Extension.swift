//
//  UIFont+Extension.swift
//  Freshop-Admin
//
//  Created by Joseph Burgess on 5/22/15.
//  Copyright (c) 2015 Joseph Burgess. All rights reserved.
//

import UIKit

extension UIFont {
    
    class func printFonts() {
        
        for familyName in UIFont.familyNames() {
            if let familyName = familyName as? String {
                println(familyName)
                for fontName in UIFont.fontNamesForFamilyName(familyName) {
                    if let fontName = fontName as? String {
                        println(" - " + fontName)
                    }
                }
            }
        }
        
    }
}