//
//  UIView+SnapShot.swift
//  CommonExtensions_test
//
//  Created by Joseph Burgess on 7/11/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
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
