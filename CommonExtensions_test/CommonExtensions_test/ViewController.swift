//
//  ViewController.swift
//  CommonExtensions_test
//
//  Created by Joe Burgess on 6/17/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    // MARK: Extensions Test
    
    func extensionTest() {
        
        println("+------------------------------");
        println(" DATE TEST");
        
        self.dateTest();
        
        println("\n+------------------------------");
        println(" STRING TEST");
        
        self.stringTest();
        
        println("\n+------------------------------");
        println(" UICOLOR TEST");
        
        self.uiColorHexTest();
        
        println("\n+------------------------------");
        println(" UIIMAGE TEST");
        
        self.uiImageColorTest();
        self.uiImageResizeTest();
        
        println("\n+------------------------------");
        println(" UIVIEW TEST");
        
        self.uiViewSnapShotTest();
    }
    
    // MARK: UIKit Tests
    
    func uiViewSnapShotTest() {
        
        println("\nBuild artwork");
        
        // Create the view container we will snap shot
        let viewContainer = UIView(frame:CGRectMake(0, 0, 200, 200));
        
        // Create Some artful views to screen shot
        let r = UIView(frame: CGRectMake(0,   0,   100, 100));
        let b = UIView(frame: CGRectMake(100, 0,   100, 100));
        let g = UIView(frame: CGRectMake(100, 100, 100, 100));
        let y = UIView(frame: CGRectMake(0,   100, 100, 100));
        
        // Color the views
        r.backgroundColor = UIColor.redColor();
        g.backgroundColor = UIColor.greenColor();
        b.backgroundColor = UIColor.blueColor();
        y.backgroundColor = UIColor.yellowColor();
        
        // Add the subviews
        viewContainer.addSubview(r);
        viewContainer.addSubview(g);
        viewContainer.addSubview(b);
        viewContainer.addSubview(y);
        
        // Add the container as a child of the root view
        self.view.addSubview(viewContainer);
        
        println("Snap shot the artwork");
        
        // Take a snapshot
        let snapshot:UIImage = viewContainer.captureSnapShot();
        
        println("Remove artwork");
        
        // Remove the view container with the art
        viewContainer.removeFromSuperview();
        
        println("Add the snapshot");
        
        // Add a view to hold the image, and stage our image
        let snapshotview:UIImageView = UIImageView(image: snapshot);
        self.view.addSubview(snapshotview);
        // Position the snapshot view
        snapshotview.center = CGPointMake(200, 200);
        
        println("Cleanup view");
        
        // Be kind, rewind
        snapshotview.removeFromSuperview();
    }
    
    func uiImageResizeTest() {
        
        // Create an image
        var testImage:UIImage = UIImage(named:"puppy-running.png");
        
        // Resize height test
        // testImage = UIImage.resizeWithImage(testImage, height: 50);
        
        println("\nImage resized by height");
        
        // Resize width test
        // testImage = UIImage.resizeWithImage(testImage, width:100);
        
        println("Image resized by width");
        
        // Resize scale test
        // testImage = UIImage.resizeWithImage(testImage, scale:0.5);
        
        println("Image resized by scale");
        
        // Resize rect test
        // testImage = UIImage.resizeWithImage(testImage, rect:CGRectMake(0, 0, 150, 40));
        
        println("Image resized by rect");
        
        // Crop image test
        // testImage = UIImage.cropWithImage(testImage, rect: CGRectMake(0, 0, 100, 100));
        
        println("Image cropped to rect");
        
        // Create the image view and add as a subview to view
        let testImageView:UIImageView = UIImageView(image:testImage);
        self.view.addSubview(testImageView);
        
        // Clean up image
        testImageView.removeFromSuperview();
        
        println("Cleanup -- Image Views removed");
    }
    
    func uiImageColorTest() {
        
        // Create a red square image
        let redImage:UIImage = UIImage.imageFromColor(UIColor.redColor());
        let redImageView:UIImageView = UIImageView(image: redImage);
        
        // Add the red image to the view
        self.view.addSubview(redImageView);
        
        println("\nRed 1x1 image added at (0,0)");
        
        let blueImage:UIImage = UIImage.imageFromColor(UIColor.blueColor(), imageSize: CGSizeMake(10, 10));
        let blueImageView:UIImageView = UIImageView(frame: CGRectMake(1, 0, 10, 10));
        
        // Add the larger blue image to the view
        blueImageView.image = blueImage;
        self.view.addSubview(blueImageView)
        
        println("Blue 10x10 image added at (1,0)");
        
        // Clean up
        redImageView.removeFromSuperview();
        blueImageView.removeFromSuperview();
        
        println("Cleanup -- Image Views removed");
    }
    
    func uiColorHexTest() {
        
        // Change the background to RED
        self.view.backgroundColor = UIColor.colorWithHex(0xFF0000);
        
        println("\nBackground color changed to RED (0xFF0000");
        
        // Change the background color back to white using hex color as a string
        self.view.backgroundColor = UIColor.colorWithHexString("#FFFFFF");
        
        println("Background color changed back to WHITE (0xFFFFFF)");
    }
    
    
    // MARK: Core Tests
    
    func stringTest() {
        
        // String + Extension
        println("\nString + Extension");
        
        var testString = "                      This is a string. 😀   ";
        var testStringTrim = testString.removeWhiteSpace();
        
        println("Test String: " + testString);
        println("Test String (white space removed): " + testStringTrim);
        
        println("Test String Length: \(testString.length)");
        println("Test String Length (white space removed): \(testStringTrim.length)");
    }
    
    func dateTest() {
        
        // Current date
        let now:NSDate = NSDate();
        
        // NSDate + Locale
        println("\nNSDate + Locale");
        println("Local Date: "  + now.getLocalizedDate());
        println("US Date: "     + now.getUSDate());
        println("GB Date: "     + now.getGBDate());
        println("JP Date: "     + now.getJPDate());
        
        // NSDate + JSON
        println("\nNSDate + JSON");
        println("JSON Date: " + NSDate.dateFromJSONString("2014-04-25T15:03:21:124Z").getLocalizedDate() );
        
        // NSDate + Elapsed
        println("\nNSDate + Elapsed");
        let gregorian:NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian);
        var offsetComponents = NSDateComponents();

        offsetComponents.second = -1;
        println("Elapsed Time (sec): " + NSDate.elapsedTimeFromDate( gregorian.dateByAddingComponents(offsetComponents, toDate:now, options:nil), toDate:now ));
        offsetComponents.minute = -1;
        println("Elapsed Time (min): " + NSDate.elapsedTimeFromDate( gregorian.dateByAddingComponents(offsetComponents, toDate:now, options:.MatchFirst), toDate:now ));
        offsetComponents.hour = -1;
        println("Elapsed Time (hour): " + NSDate.elapsedTimeFromDate( gregorian.dateByAddingComponents(offsetComponents, toDate:now, options:.MatchFirst), toDate:now ));
        offsetComponents.day = -1;
        println("Elapsed Time (day): " + NSDate.elapsedTimeFromDate( gregorian.dateByAddingComponents(offsetComponents, toDate:now, options:.MatchFirst), toDate:now ));
        offsetComponents.day = -7;
        println("Elapsed Time (week): " + NSDate.elapsedTimeFromDate( gregorian.dateByAddingComponents(offsetComponents, toDate:now, options:.MatchFirst), toDate:now ));
        offsetComponents.month = -1;
        println("Elapsed Time (month): " + NSDate.elapsedTimeFromDate( gregorian.dateByAddingComponents(offsetComponents, toDate:now, options:.MatchFirst), toDate:now ));
        offsetComponents.year = -1;
        println("Elapsed Time (year): " + NSDate.elapsedTimeFromDate( gregorian.dateByAddingComponents(offsetComponents, toDate:now, options:.MatchFirst),
                                                                      toDate:now,  scannedFormat:"Scanned %d %@ ago"));
    }
    
    
    // MARK: View Management
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.extensionTest();
    }
}

