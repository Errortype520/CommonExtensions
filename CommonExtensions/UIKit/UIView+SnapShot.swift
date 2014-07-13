//
//  UIView+SnapShot.swift
//  CommonExtensions_test
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

extension UIView {
    
    /**
    *  Capture a snap shot of the UIView
    *
    *  @return Return spanshot as UIImage
    */
    func captureSnapShot() -> UIImage {
        
        // Begin new context
        UIGraphicsBeginImageContextWithOptions(self.frame.size, true, 0);
        
        // Render the layer and capture the image
        self.layer.renderInContext(UIGraphicsGetCurrentContext());
        // Capture the image
        var snapshot:UIImage = UIGraphicsGetImageFromCurrentImageContext();
        
        // Remove context from top of stack
        UIGraphicsEndImageContext();
        
        // Return the created snapshot
        return snapshot;
    }
    
    /**
    *  Capture a snapshot of the UIView and blur it
    *
    *  @return Blurred snapshot as UIImage
    */
    
    // TODO: Will use iOS 8 blur effect
    
    
}
