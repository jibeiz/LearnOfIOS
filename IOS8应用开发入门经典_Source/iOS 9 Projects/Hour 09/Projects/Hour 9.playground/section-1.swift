// Playground - noun: a place where people can play

import UIKit
import XCPlayground

var appleView: UIWebView=UIWebView(frame:CGRectMake(0, 0, 400, 400))

var appleURL: NSURL
appleURL=NSURL(string: "https://www.apple.com")!
appleView.loadRequest(NSURLRequest(URL:appleURL))

XCPlaygroundPage.currentPage.liveView = appleView

