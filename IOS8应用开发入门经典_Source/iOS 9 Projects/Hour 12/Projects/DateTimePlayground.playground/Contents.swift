//: Playground - noun: a place where people can play

import UIKit

let currentDate: NSDate = NSDate()

let dateFormat: NSDateFormatter = NSDateFormatter()
dateFormat.dateFormat = "MM/dd/yy hh:mm a"

let myDate: NSDate = dateFormat.dateFromString("12/25/1970 10:00 AM")!

currentDate.earlierDate(myDate)
currentDate.laterDate(myDate)

myDate.earlierDate(currentDate)
myDate.laterDate(currentDate)

currentDate.timeIntervalSinceDate(myDate)

currentDate.timeIntervalSinceDate(myDate) / 60
currentDate.timeIntervalSinceDate(myDate) / 3600
currentDate.timeIntervalSinceDate(myDate) / 86400
currentDate.timeIntervalSinceDate(myDate) / 31536000
