CommonExtensions
================

Common Extensions for Swift Alpha 0.3

####UIView+SnapShot
Captures a snapshot of a UIView.
```swift
// Take a snapshot
let snapshot:UIImage = captureMeView.captureSnapShot();
```

####UIImage+Resize
Resize and crop UIImage when you need to manipulate a UIImage, and not just it's UIImageView.
```swift
// Create an image
var testImage:UIImage = UIImage(named:"puppy-running.png");

// Resize the image proportionately with a height
testImage = UIImage.resizeWithImage(testImage, height: 50);

// Resize the image proportionately with a width
testImage = UIImage.resizeWithImage(testImage, width:100);
        
// Resize the image proportionately with a scale
testImage = UIImage.resizeWithImage(testImage, scale:0.5);
        
// Resize the image to fit in rectangle
testImage = UIImage.resizeWithImage(testImage, rect:CGRectMake(0, 0, 150, 40));
        
// Crop image with rectangle
testImage = UIImage.cropWithImage(testImage, rect: CGRectMake(0, 0, 100, 100));
```

####UIColor+Hex
Create UIColor with Hex values
```swift
// Change the background to RED
self.view.backgroundColor = UIColor.colorWithHex(0xFF0000);

// Change the background color back to white using hex color as a string
self.view.backgroundColor = UIColor.colorWithHexString("#FFFFFF");
```

####UIImage+Color
Creates a UIImage with a solid color. Can specify a image size (Defaults to 1x1).
```swift
// Create a red square image (1x1)
let redImage:UIImage = UIImage.imageFromColor(UIColor.redColor());

// Create a blue square image (10x10)
let blueImage:UIImage = UIImage.imageFromColor(UIColor.blueColor(), imageSize: CGSizeMake(10, 10));
```

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

####String+Extensions
String extensions adds common length variable and a remove white space method.
```swift
var testString = "                      This is a string. ";
var testStringTrim = testString.removeWhiteSpace();

println("Test String: " + testString);
println("Test String (white space removed): " + testStringTrim);

println("Test String Length: \(testString.length)");
println("Test String Length (white space removed): \(testStringTrim.length)");

// RESULT: Test String:                       This is a string.  
// RESULT: Test String (white space removed): This is a string.
// RESULT: Test String Length: 39
// RESULT: Test String Length (white space removed): 17
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
