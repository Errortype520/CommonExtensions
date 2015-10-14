//
//  UIFont+Extension.swift
//  Freshop-Admin
//
//  Created by Joseph Burgess on 5/22/15.
//  Copyright (c) 2015 Joseph Burgess. All rights reserved.
//

import UIKit

public extension UIFont {
    
    public class func printFonts() {
        for familyName in UIFont.familyNames() {
            print(familyName)
            for fontName in UIFont.fontNamesForFamilyName(familyName) {
                print(" - " + fontName)
            }
        }    
    }
    
}