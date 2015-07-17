//
//  NSDate+Locale.swift
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

extension NSDate {
    
    // MARK: Convenience quick dates
    
    /**
    *  Get simplified date for current location
    *
    *  @return Date string (Local format)
    */
    func getLocalizedDate() -> String {
        return self.getDateWithLocale(NSLocale.currentLocale())
    }
    
    /**
    *  Get US date (MM/dd/yyyy) as String
    *
    *  @return Date string (US format)
    */
    func getUSDate() -> String {
        return self.getDateWithLocaleIdentifier("en_US")
    }
    
    /**
    *  Get GB date (dd/MM/yyyy) as String
    *
    *  @return Date string (GB format)
    */
    func getGBDate() -> String {
        return self.getDateWithLocaleIdentifier("en_GB")
    }
    
    /**
    *  Get JP date (yyyy/MM/dd) as String
    *
    *  @return Date string (JP format)
    */
    func getJPDate() -> String {
        return self.getDateWithLocaleIdentifier("ja_JP")
    }
    
    /**
    *  Get date as string with a locale Identifier.
    *
    *  @param localeIdentifier Locale Identifier (ex. @"en_US")
    *
    *  @return Date string in specified format
    */
    func getDateWithLocaleIdentifier(localeIdentifier:String) -> String {
        return self.getDateWithLocale( NSLocale(localeIdentifier:localeIdentifier))
    }
    
    
    // MARK: Date with Locale
    
    /**
    *  Get date as string with locale and default date components (yyyyMMdd)
    *
    *  @param locale Locale for date
    *
    *  @return Date string with specified format
    */
    func getDateWithLocale(locale:NSLocale) -> String {
        return self.getDateWithLocale(locale, dateComponents:"yyyyMMdd")
    }
    
    /**
    *  Get date as string with locale and specified date components
    *
    *  @param locale         NSLocale for date
    *  @param dateComponents Components needed for date
    *
    *  @return Date string with specified locale and components
    */
    func getDateWithLocale(locale:NSLocale, dateComponents:String) -> String {
        let format:String = self.getDateFormatWithLocale(locale, dateComponents:dateComponents)
        let dateFormatter:NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.stringFromDate(self)
    }
    
    
    // MARK: Date Format
    
    /**
    *  Get date format for locale and components
    *
    *  @param locale         Locale for date formatter
    *  @param dateComponents Components needed for date formatter
    *
    *  @return Date format with specified locale and components
    */
    func getDateFormatWithLocale(locale:NSLocale, dateComponents:String) -> String {
        return NSDateFormatter.dateFormatFromTemplate(dateComponents, options: 0, locale: locale)!
    }
}
