//
//  NSDate+Elapsed.swift
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

import Foundation

public extension NSDate {
    
    /**
    * Returns the date components (Years, Months, Days, Hours, Minutes, Seconds) between the two specified dates.
    *
    * @param fromDate Start date
    * @param toDate End Date
    *
    * @return Components between the two dates
    */
    public class func elapsedDateComponentsFromDate(fromDate:NSDate, toDate:NSDate) -> NSDateComponents {

        // Default componenets
        let desiredComponents:NSCalendarUnit =  [NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day, NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second]
        
        // Elapsed Time units
        let elapsedTimeUnits:NSDateComponents = NSCalendar.currentCalendar().components(desiredComponents, fromDate: fromDate, toDate: toDate, options: NSCalendarOptions.MatchFirst)
        
        return elapsedTimeUnits
    }
    
    /**
    * Returns the string representing the time between the two dates, with a default scan format (ex. Created 10 minutes ago)
    *
    * @param fromDate Start date
    * @param toDate End Date
    *
    * @return string representing time between the two dates
    */
    public class func elapsedTimeFromDate(fromDate:NSDate, toDate:NSDate) -> String {
        return self.elapsedTimeFromDate(fromDate, toDate:toDate, scannedFormat:"Created %d %@ ago")
    }
    
    
    /**
    * Returns a simplified string representing the time between the two dates
    *
    * @param fromDate Start date
    * @param End Date
    * @param User defined format (Must contain %d and %@ in string, in order)
    *
    * @return string representing time between the two dates
    */
    public class func elapsedTimeFromDate(fromDate:NSDate, toDate:NSDate, scannedFormat:String) -> String {
        
        let elapsedTimeUnits:NSDateComponents = self.elapsedDateComponentsFromDate(fromDate, toDate: toDate)
        
        // The number and the unit
        var number:Int = 0
        var unit:String
        
        // Get our highest unit as return string
        if (elapsedTimeUnits.year > 0) {
            number = elapsedTimeUnits.year
            unit = "year"
        }
        else if (elapsedTimeUnits.month > 0) {
            number = elapsedTimeUnits.month
            unit = "month"
        }
        else if (elapsedTimeUnits.day >= 7) {
            number = elapsedTimeUnits.day / 7
            unit = "week"
        }
        else if (elapsedTimeUnits.day > 0) {
            number = elapsedTimeUnits.day
            unit = "day"
        }
        else if (elapsedTimeUnits.hour > 0) {
            number = elapsedTimeUnits.hour
            unit = "hour"
        }
        else if (elapsedTimeUnits.minute > 0) {
            number = elapsedTimeUnits.minute
            unit = "minute"
        }
        else  {
            number = elapsedTimeUnits.second
            unit = "second"
        }
        
        // Check if unit number is greater than 1, if so append s at the end
        if (number > 1) {
            unit += "s"
        }
        
        // Return elapsed time using the scanned format
        return String(format:scannedFormat, number, unit)
    }
    
}