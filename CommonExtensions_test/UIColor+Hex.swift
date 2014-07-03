//
//  UIColor+Hex.swift
//  CommonExtensions_test
//
//  Created by Joseph Burgess on 7/2/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

import UIKit

extension UIColor {
    
    /**
    * Convert HEX color to UIColor
    *
    * @param the HEX value
    *
    * @return UIColor created from HEX
    */
    class func colorWithHex(color:UInt) -> UIColor {
        
        return UIColor( red:    ((Float)((color & 0xFF0000) >> 16))/255.0,
                        green:  ((Float)((color & 0xFF00) >> 8))/255.0,
                        blue:   ((Float)((color & 0xFF)))/255.0,
                        alpha:  1.0);
    }
    
    /**
    * Convert HEX color as String to UIColor
    *
    * @param the HEX value as a String
    *
    * @return UIColor created from HEX
    */
    class func colorWithHexString(color:String) -> UIColor {
        
        var result:UIColor;
        var value:CUnsignedInt = 0;
        var hexString:String = color.stringByReplacingOccurrencesOfString("#", withString:"0x");
        
        // If scanner is able to convert the string to UInt
        if ( NSScanner.scannerWithString(hexString).scanHexInt(&value) ) {
            return self.colorWithHex(UInt(value));
        }
        
        // Default return clear color if parsing color fails
        return UIColor.clearColor();
    }
    
}