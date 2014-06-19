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
        
        
    }
    
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

