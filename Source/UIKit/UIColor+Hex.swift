//
//  UIColor+Hex.swift
//  CommonExtensions
//
//  Copyright (c) 2014 Joe Burgess
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
//  documentation files (the "Software"), to deal in the Software without restriction, including without limitation
//  the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
//  and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
//  LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
//  EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR
//  THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

import UIKit

public extension UIColor {
    
    /**
    * Convert HEX color to UIColor
    *
    * @param the HEX value
    *
    * @return UIColor created from HEX
    */
    public class func colorFromHex(color:UInt) -> UIColor {
        
        return UIColor( red:    ((CGFloat)((color & 0xFF0000) >> 16)) / 255.0,
                        green:  ((CGFloat)((color & 0xFF00) >> 8)) / 255.0,
                        blue:   ((CGFloat)((color & 0xFF))) / 255.0,
                        alpha:  1.0)
    }
    
    /**
    * Convert HEX color as String to UIColor
    *
    * @param the HEX value as a String
    *
    * @return UIColor created from HEX
    */
    public class func colorFromHex(string color:String) -> UIColor {
        
        var value:CUnsignedInt = 0
        let hexString:String = color.stringByReplacingOccurrencesOfString("#", withString:"0x")
        
        // If scanner is able to convert the string to UInt
        if ( NSScanner.localizedScannerWithString(hexString).scanHexInt(&value) ) {
            return self.colorFromHex( UInt(value) )
        }
        
        // Default return clear color if parsing color fails
        return UIColor.clearColor()
    }
}