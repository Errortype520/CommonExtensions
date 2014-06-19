//
//  NSString+Extension.swift
//  CommonExtensions_test
//
//  Created by Joe Burgess on 6/19/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

import Foundation

extension String {
    
    /// Number of items in string
    var length:Int { get{ return countElements(self) } };
    
    /**
    * Returns a new string with whitespace removed
    *
    * @return New string with whitespace removed
    */
    func removeWhiteSpace() -> String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet());
    }
    
}