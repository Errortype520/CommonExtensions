CommonExtensions 2.0.0
================

Common Extensions for Swift are a collection of commonly used extensions to existing Swift and UIKit classes. These will be modified, added to and possibly removed as Swift develops as a language, and as I learn more about what Swift has to offer.

*Suggestions and pull requests are __welcomed__ and __encouraged__*.


####UIView+SnapShot
Captures a snapshot of a UIView.
```swift
// Take a snapshot
let snapshot:UIImage = captureMeView.captureSnapShot()
```

####UIColor+Hex
Create UIColor with Hex values
```swift
// Change the background to RED
self.view.backgroundColor = UIColor.colorFromHex(0xFF0000)

// Change the background color back to white using hex color as a string
self.view.backgroundColor = UIColor.colorFromHex(string:"#FFFFFF")
```

####UIImage+Resize
Resize and crop UIImage when you need to manipulate a UIImage, and not just it's UIImageView.
```swift
// Create an image
var testImage:UIImage = UIImage(named:"puppy-running.png")!

// Resize the image proportionately with a height
testImage = UIImage.resize(image: testImage, height: 50)

// Resize the image proportionately with a width
testImage = UIImage.resize(image: testImage, width:100)
        
// Resize the image proportionately with a scale
testImage = UIImage.resize(image: testImage, scale:0.5)
        
// Resize the image to fit in rectangle
testImage = UIImage.resize(image: testImage, rect:CGRect(x:0, y:0, width:150, height:40))
        
// Crop image with rectangle
testImage = UIImage.resize(image: testImage, rect: CGRect(x:0, y:0, width:100, height:100))
```

####UIImage+Color
Creates a UIImage with a solid color. Can specify a image size (Defaults to 1x1).
```swift
// Create a red square image (1x1)
let redImage:UIImage = UIImage.image(fromColor: UIColor.red)

// Create a blue square image (10x10)
let blueImage:UIImage = UIImage.image(fromColor:UIColor.blue, imageSize: CGSize(width:10, height:10))
```

####NSDate+Locale
NSDate+Locale contains convenience methods to get the current date as a String in different formats.
```swift
// Current date
let now:NSDate = NSDate()
println("Local: "  + now.getLocalizedDate())   // RESULT: Local Date: 07/02/2014
println("US Date: "     + now.getUSDate())     // RESULT: US Date: 07/02/2014
println("GB Date: "     + now.getGBDate())     // RESULT: GB Date: 02/07/2014
println("JP Date: "     + now.getJPDate())     // RESULT: JP Date: 2014/07/02
```

####NSDate+JSON
NSDate+JSON converts JSON String to NSDate.
```swift
var date:Date = Date.date(fromJSONDate:"2014-04-25T15:03:21Z")
println("JSON Date: " + date.getLocalizedDate() )

// RESULT: JSON Date: 04/25/2014
```

####NSDate+Elapsed
NSDate+Elapsed contains methods to get amount of time between two dates (DateComponenets, or string representing time between [Good for blog entries]).
```swift
// Calendar and offset components
let gregorian:NSCalendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
var offsetComponents = NSDateComponents()
offsetComponents.month = -1

var fromDate:Date = gregorian.date(byAdding: offsetComponents as DateComponents, to:now, options:.matchFirst)!
println("Elapsed Time (month): " + Date.elapsedTime(fromDate: fromDate, toDate:now ) )

// RESEULT: Elapsed Time (month): Created 1 month ago
```


####License

Copyright (c) 2014-2016 Joe Burgess

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
