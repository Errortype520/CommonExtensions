//
//  UIImage+Color.swift
//  CommonExtensions_test
//
//  Copyright (c) 2014-2016 Joe Burgess
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

public extension UIImage {
    
    /** 
    * Creates an image from a UIColor.
    *
    * @param UIColor used for the image
    * @param Size to make the image
    *
    * @return UIImage created from color.
    */
    public class func image(fromColor color:UIColor, imageSize:CGSize = CGSize(width: 1, height: 1) ) -> UIImage {
        
        // Create a rectangle with our size
        let rect:CGRect = CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height)
        
        // Start drawing using image size
        UIGraphicsBeginImageContext(imageSize)
        
        // Get the current graphics context
        let context:CGContext = UIGraphicsGetCurrentContext()!
        // Set the fill color and draw a rectangle with our required size
        context.setFillColor(color.cgColor)
        context.fill(rect)
        
        // Create a UIImage from the current graphics context
        let image:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        // Remove the current graphics context from the top of the stack
        UIGraphicsEndImageContext()
        
        return image
        
    }
    
}
