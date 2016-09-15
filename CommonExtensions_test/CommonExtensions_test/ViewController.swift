//
//  ViewController.swift
//  CommonExtensions_test
//
//  Created by Joe Burgess on 6/09/15.
//  Copyright (c) 2016 Joe Burgess. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    // MARK: Extensions Test
    
    func extensionTest() {
        
        print("+------------------------------")
        print(" DATE TEST")
        
        self.dateTest()
        
        print("\n+------------------------------")
        print(" UICOLOR TEST")
        
        self.uiColorHexTest()
        
        print("\n+------------------------------")
        print(" UIIMAGE TEST")
        
        self.uiImageColorTest()
        self.uiImageResizeTest()
        
        print("\n+------------------------------")
        print(" UIVIEW TEST")
        
        self.uiViewSnapShotTest()
        
    }
    
    // MARK: UIKit Tests
    
    func uiViewSnapShotTest() {
        
        print("\nBuild artwork")
        
        // Create the view container we will snap shot
        let viewContainer = UIView(frame: CGRect(x:0, y:0, width:200, height:200) )
        
        // Create Some artful views to screen shot
        let r = UIView(frame: CGRect(x:0,   y:0,   width:100, height:100))
        let b = UIView(frame: CGRect(x:100, y:0,   width:100, height:100))
        let g = UIView(frame: CGRect(x:100, y:100, width:100, height:100))
        let y = UIView(frame: CGRect(x:0,   y:100, width:100, height:100))
        
        // Color the views
        r.backgroundColor = UIColor.red
        g.backgroundColor = UIColor.green
        b.backgroundColor = UIColor.blue
        y.backgroundColor = UIColor.yellow
        
        // Add the subviews
        viewContainer.addSubview(r)
        viewContainer.addSubview(g)
        viewContainer.addSubview(b)
        viewContainer.addSubview(y)
        
        // Add the container as a child of the root view
        self.view.addSubview(viewContainer)
        
        print("Snap shot the artwork")
        
        // Take a snapshot
        let snapshot:UIImage = viewContainer.captureSnapShot()
        
        print("Remove artwork")
        
        // Remove the view container with the art
        viewContainer.removeFromSuperview()
        
        print("Add the snapshot")
        
        // Add a view to hold the image, and stage our image
        let snapshotview:UIImageView = UIImageView(image: snapshot)
        self.view.addSubview(snapshotview)
        
        // Position the snapshot view
        snapshotview.center = CGPoint(x:200, y:200)
        
        print("Cleanup view")
        
        // Be kind, rewind
        snapshotview.removeFromSuperview()
    }
    
    func uiImageResizeTest() {
        
        // Create an image
        var testImage:UIImage = UIImage(named:"puppy-running.png")!
        
        // Resize height test
        testImage = UIImage.resize(image: testImage, height: 50)
        
        print("\nImage resized by height")
        
        // Resize width test
        testImage = UIImage.resize(image: testImage, width:100)
        
        print("Image resized by width")
        
        // Resize scale test
        testImage = UIImage.resize(image: testImage, scale:0.5)
        
        print("Image resized by scale")
        
        // Resize rect test
        testImage = UIImage.resize(image: testImage, rect:CGRect(x:0, y:0, width:150, height:40))
        
        print("Image resized by rect")
        
        // Crop image test
        testImage = UIImage.resize(image: testImage, rect: CGRect(x:0, y:0, width:100, height:100))
        
        print("Image cropped to rect")
        
        // Create the image view and add as a subview to view
        let testImageView:UIImageView = UIImageView(image:testImage)
        self.view.addSubview(testImageView)
        
        // Clean up image
        testImageView.removeFromSuperview()
        
        print("Cleanup -- Image Views removed")
    }
    
    func uiImageColorTest() {
        
        // Create a red square image
        let redImage:UIImage = UIImage.image(fromColor: UIColor.red)
        let redImageView:UIImageView = UIImageView(image: redImage)
        
        // Add the red image to the view
        self.view.addSubview(redImageView)
        
        print("\nRed 1x1 image added at (0,0)")
        
        let blueImage:UIImage = UIImage.image(fromColor:UIColor.blue, imageSize: CGSize(width:10, height:10))
        let blueImageView:UIImageView = UIImageView(frame: CGRect(x:1, y:0, width:10, height:10))
        
        // Add the larger blue image to the view
        blueImageView.image = blueImage
        self.view.addSubview(blueImageView)
        
        print("Blue 10x10 image added at (1,0)")
        
        // Clean up
        redImageView.removeFromSuperview()
        blueImageView.removeFromSuperview()
        
        print("Cleanup -- Image Views removed")
    }
    
    func uiColorHexTest() {
        
        // Change the background to RED
        self.view.backgroundColor = UIColor.colorFromHex(color:0xFF0000)
        
        print("\nBackground color changed to RED (0xFF0000")
        
        // Change the background color back to white using hex color as a string
        self.view.backgroundColor = UIColor.colorFromHex(string:"#FFFFFF")
        
        print("Background color changed back to WHITE (0xFFFFFF)")
    }
    
    
    // MARK: Core Tests
    
    func dateTest() {
        
        // Current date
        let now:Date = Date()
        
        // NSDate + Locale
        print("\nNSDate + Locale")
        print("Local Date: "  + now.getLocalizedDate())
        print("US Date: "     + now.getUSDate())
        print("GB Date: "     + now.getGBDate())
        print("JP Date: "     + now.getJPDate())
        
        // NSDate + JSON
        print("\nNSDate + JSON")
        print("JSON Date: " + (Date.date(fromJSONDate:"2014-04-25T15:03:21Z")!.getLocalizedDate()) )
        
        // NSDate + Elapsed
        print("\nNSDate + Elapsed")
        let gregorian:NSCalendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        let offsetComponents = NSDateComponents()

        offsetComponents.second = -1
        print("Elapsed Time (sec): " +   Date.elapsedTime(fromDate: gregorian.date(byAdding: offsetComponents as DateComponents, to:now, options:[])!, toDate:now ))
        offsetComponents.minute = -1
        print("Elapsed Time (min): " +   Date.elapsedTime(fromDate: gregorian.date(byAdding: offsetComponents as DateComponents, to:now, options:.matchFirst)!, toDate:now ))
        offsetComponents.hour = -1
        print("Elapsed Time (hour): " +  Date.elapsedTime(fromDate: gregorian.date(byAdding: offsetComponents as DateComponents, to:now, options:.matchFirst)!, toDate:now ))
        offsetComponents.day = -1
        print("Elapsed Time (day): " +   Date.elapsedTime(fromDate: gregorian.date(byAdding: offsetComponents as DateComponents, to:now, options:.matchFirst)!, toDate:now ))
        offsetComponents.day = -7
        print("Elapsed Time (week): " +  Date.elapsedTime(fromDate: gregorian.date(byAdding: offsetComponents as DateComponents, to:now, options:.matchFirst)!, toDate:now ))
        offsetComponents.month = -1
        print("Elapsed Time (month): " + Date.elapsedTime(fromDate: gregorian.date(byAdding: offsetComponents as DateComponents, to:now, options:.matchFirst)!, toDate:now ))
        offsetComponents.year = -1
        print("Elapsed Time (year): " +  Date.elapsedTime(fromDate: gregorian.date(byAdding: offsetComponents as DateComponents, to:now, options:.matchFirst)!,
                                                                      toDate:now,  scannedFormat:"Scanned %d %@ ago"))
    }
    
    
    // MARK: View Management
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.extensionTest()
    }
}

