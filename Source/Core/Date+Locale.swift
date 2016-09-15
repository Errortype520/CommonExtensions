//
//  Date+Locale.swift
//  CommonExtensions
//
//  Copyright (c) 2014-2016 Joe Burgess
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

public extension Date {
    
    // MARK: Convenience quick dates
    
    /**
    *  Get simplified date for current location
    *
    *  @return Date string (Local format)
    */
    public func getLocalizedDate() -> String {
        return self.getDate(withLocale:Locale.current)
    }
    
    /**
    *  Get US date (MM/dd/yyyy) as String
    *
    *  @return Date string (US format)
    */
    public func getUSDate() -> String {
        return self.getDate(withLocaleIdentifier:"en_US")
    }
    
    /**
    *  Get GB date (dd/MM/yyyy) as String
    *
    *  @return Date string (GB format)
    */
    public func getGBDate() -> String {
        return self.getDate(withLocaleIdentifier:"en_GB")
    }
    
    /**
    *  Get JP date (yyyy/MM/dd) as String
    *
    *  @return Date string (JP format)
    */
    public func getJPDate() -> String {
        return self.getDate(withLocaleIdentifier:"ja_JP")
    }
    
    /**
    *  Get date as string with a locale Identifier.
    *
    *  @param localeIdentifier Locale Identifier (ex. @"en_US")
    *
    *  @return Date string in specified format
    */
    public func getDate(withLocaleIdentifier localeIdentifier:String) -> String {
        return self.getDate(withLocale: Locale(identifier:localeIdentifier))
    }
    
    /**
    *  Get date as string with locale and specified date components
    *
    *  @param locale         NSLocale for date
    *  @param dateComponents Components needed for date
    *
    *  @return Date string with specified locale and components
    */
    public func getDate(withLocale locale:Locale, dateComponents:String = "yyyyMMdd") -> String {
        let format:String = self.getDateFormat(withLocale: locale, dateComponents:dateComponents)
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
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
    public func getDateFormat(withLocale locale:Locale, dateComponents:String) -> String {
        return DateFormatter.dateFormat(fromTemplate: dateComponents, options: 0, locale: locale)!
    }
}
