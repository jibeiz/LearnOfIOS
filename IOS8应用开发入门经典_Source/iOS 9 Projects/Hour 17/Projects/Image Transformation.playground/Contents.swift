//: Playground - noun: a place where people can play

import UIKit

var testView: UIView = UIView(frame:CGRectMake(0,0,300,300))

var testImageView: UIImageView =
    UIImageView(image:UIImage(named: "flower.png"))
testImageView.frame=CGRectMake(50.0,50.0,100.0,100.0)
testImageView.transform = CGAffineTransformMakeRotation(0.8)

testView.addSubview(testImageView)
