//
//  NSDate+JSON.swift
//  CommonExtensions_test
//
//  Created by Joe Burgess on 6/18/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

import Foundation

extension NSDate {

    /**
    * Parses JSON Date and returns an NSDate.
    *
    * @param jsonDate The JSON formatted date string
    *
    * @return NSDate created from JSON Date string.
    */
    class func dateFromJSONString(jsonDate:String) -> NSDate {
        
        var adjustedDate:String = jsonDate;
        
        // Replace offset 'T' with a space
        adjustedDate = adjustedDate.stringByReplacingOccurrencesOfString("T", withString:" ");
        // Replace zulu 'Z' with timezone (+0000)
        adjustedDate = adjustedDate.stringByReplacingOccurrencesOfString("Z", withString:"+0000");
        
        // Create the dateformatter we will use to parse the JSON date
        var dateFormatter:NSDateFormatter = NSDateFormatter();
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss:SSSZZZ";
        
        return dateFormatter.dateFromString(adjustedDate);
    }
    
}
