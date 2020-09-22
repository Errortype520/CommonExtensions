//
//  Date+JSON.swift
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

    /**
    * Parses JSON Date and returns an NSDate.
    *
    * @param jsonDate The JSON formatted date string
    *
    * @return NSDate created from JSON Date string.
    */
    public static func date(fromJSONDate jsonDate:String?) -> Date? {
        
        guard let jsonDate = jsonDate else { return nil }
        
        let parser1 = DateFormatter()
        parser1.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let parser2 = DateFormatter()
        parser2.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        let parsers = [parser1, parser2]
        
        for parser in parsers {
            guard let result = parser.date(from: jsonDate) else { continue }
            return result
        }
        
        return nil
    }
    
}
