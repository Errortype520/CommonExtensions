//
//  NSDate+Locale.swift
//  CommonExtensions_test
//
//  Created by Joe Burgess on 6/17/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
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
        return self.getDateWithLocale(NSLocale.currentLocale());
    }
    
    /**
    *  Get US date (MM/dd/yyyy) as String
    *
    *  @return Date string (US format)
    */
    func getUSDate() -> String {
        return self.getDateWithLocaleIdentifier("en_US");
    }
    
    /**
    *  Get GB date (dd/MM/yyyy) as String
    *
    *  @return Date string (GB format)
    */
    func getGBDate() -> String {
        return self.getDateWithLocaleIdentifier("en_GB");
    }
    
    /**
    *  Get JP date (yyyy/MM/dd) as String
    *
    *  @return Date string (JP format)
    */
    func getJPDate() -> String {
        return self.getDateWithLocaleIdentifier("ja_JP");
    }
    
    /**
    *  Get date as string with a locale Identifier.
    *
    *  @param localeIdentifier Locale Identifier (ex. @"en_US")
    *
    *  @return Date string in specified format
    */
    func getDateWithLocaleIdentifier(localeIdentifier:String) -> String {
        return self.getDateWithLocale( NSLocale(localeIdentifier:localeIdentifier));
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
        return self.getDateWithLocale(locale, dateComponents:"yyyyMMdd");
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
        let format:String = self.getDateFormatWithLocale(locale, dateComponents:dateComponents);
        let dateFormatter:NSDateFormatter = NSDateFormatter();
        dateFormatter.dateFormat = format;
        return dateFormatter.stringFromDate(self);
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
        return NSDateFormatter.dateFormatFromTemplate(dateComponents, options: 0, locale: locale);
    }
}
