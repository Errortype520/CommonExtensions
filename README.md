CommonExtensions
================

Common Extensions for Swift Alpha 0.1

####NSDate+Locale
NSDate+Locale contains convenience methods to get the current date as a String in different formats.
```swift
// Current date
let now:NSDate = NSDate();
println("Local: "  + now.getLocalizedDate());   // RESULT: Local Date: 07/02/2014
println("US Date: "     + now.getUSDate());     // RESULT: US Date: 07/02/2014
println("GB Date: "     + now.getGBDate());     // RESULT: GB Date: 02/07/2014
println("JP Date: "     + now.getJPDate());     // RESULT: JP Date: 2014/07/02
```

####NSDate+JSON
NSDate+JSON converts JSON String to NSDate.
```swift
var date:NSDate = NSDate.dateFromJSONString("2014-04-25T15:03:21:124Z");
println("JSON Date: " + date.getLocalizedDate() );

// RESULT: JSON Date: 04/25/2014
```

####NSDate+Elapsed
NSDate+Elapsed contains methods to get amount of time between two dates (DateComponenets, or string representing time between [Good for blog entries]).
```swift
// Calendar and offset components
let gregorian:NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian);
var offsetComponents = NSDateComponents();
offsetComponents.month = -1;

var fromDate:NSDate = gregorian.dateByAddingComponents(offsetComponents, toDate:now,
                                                       options:.MatchFirst);
println("Elapsed Time (month): " + NSDate.elapsedTimeFromDate( fromDate, toDate:now ));

// RESEULT: Elapsed Time (month): Created 1 month ago
```

####License

Copyright (c) 2014 Joe Burgess

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
