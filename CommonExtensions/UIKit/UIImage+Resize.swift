//
//  UIImage+Resize.swift
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

extension UIImage {
    
    // MARK: Resizing image
    
    /**
    * Resize an image to a specified height.
    * 
    * @param The image to resize
    * @param The hight we are resizing to
    *
    * @return The resized image
    */
    class func resizeWithImage(image:UIImage, height:Float) -> UIImage {
        
        // Calculate scale needed to adjust to new image size
        let scale:Float = height / image.size.height;
        return resizeWithImage(image, scale: scale);
    }
    
    /**
    * Resize an image to a specified width.
    *
    * @param The image to resize
    * @param The width we are resizing to
    *
    * @return The resized image
    */
    class func resizeWithImage(image:UIImage, width:Float)  -> UIImage {
        // Calculate scale needed to adjust to new image size
        let scale:Float = width / image.size.width;
        return resizeWithImage(image, scale: scale);
    }
    
    /**
    * Resize an image to a specified scale.
    *
    * @param The image to resize
    * @param The scale to resize the image to
    *
    * @return The resized image
    */
    class func resizeWithImage(image:UIImage, scale:Float)  -> UIImage {
        
        // Calcualte the rectangle for our resized image
        let resizedRect:CGRect = CGRectMake(0, 0, image.size.width * scale, image.size.height * scale);
        // Return the new UIImage created using the scaled rectangle
        return UIImage.resizeWithImage(image, rect:resizedRect);
    }
    
    /**
    * Resize an image to fit in rect
    *
    * @param The image to resize
    * @param The rectangle to resize the image in
    *
    * @return The resized image
    */
    class func resizeWithImage(image:UIImage, rect:CGRect) -> UIImage {
        
        // Creates a bitmap-based graphics context
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(rect.size.width, rect.size.height), true, 0);
        
        // Current graphic context
        let context:CGContextRef = UIGraphicsGetCurrentContext();
        // Use Best quality
        CGContextSetInterpolationQuality(context, kCGInterpolationHigh);
        image.drawInRect(rect);
        
        // Image based on the graphics context
        let resizedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext();

        // Remove the current graphics context from the top of the stack
        UIGraphicsEndImageContext();
        
        // Return the resized image
        return resizedImage;
    }
    
    // MARK: Crop image
    
    /**
    * Crop an image to rectangle
    *
    * @param The image to resize
    * @param The rectangle used to crop the image
    *
    * @return The cropped image
    */
    class func cropWithImage(image:UIImage, rect:CGRect) -> UIImage {

        // Crop rectangle scaled with image scale
        let cropRect:CGRect = CGRectMake(rect.origin.x * image.scale, rect.origin.y * image.scale,
                                         rect.size.width * image.scale, rect.size.height * image.scale);
        // Crop the image
        let imageRef:CGImageRef = CGImageCreateWithImageInRect(image.CGImage, cropRect);
        let cropImage:UIImage   = UIImage(CGImage:imageRef, scale:image.scale, orientation:image.imageOrientation);
        
        // TODO: Possible memory leak below?
        
        // Release image ref
        // CGImageRelease(imageRef);
        
        // Return the cropped image
        return cropImage;
    }
}
