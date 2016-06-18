//
//  ViewController.swift
//  Gestures
//
//  Created by John Ray on 10/12/14.
//  Copyright (c) 2014 John E. Ray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var originalRect: CGRect!
    
    @IBAction func foundTap(sender: AnyObject) {
        outputLabel.text="Tapped"
    }
    
    @IBAction func foundSwipe(sender: AnyObject) {
        outputLabel.text="Swiped"
    }
    
    @IBAction func foundPinch(sender: AnyObject) {
        var recognizer: UIPinchGestureRecognizer
        var feedback: String
        var scale: CGFloat
        
        recognizer=sender as! UIPinchGestureRecognizer
        scale=recognizer.scale
        imageView.transform = CGAffineTransformMakeRotation(0.0)
        
        feedback=String(format: "Pinched, Scale: %1.2f, Velocity: %1.2f",
            Float(recognizer.scale),Float(recognizer.velocity))
        outputLabel.text=feedback
        imageView.frame = CGRectMake(self.originalRect.origin.x,
                            originalRect.origin.y,
                            originalRect.size.width*scale,
                            originalRect.size.height*scale);
    }
    
    @IBAction func foundRotation(sender: AnyObject) {
        var recognizer: UIRotationGestureRecognizer
        var feedback: String
        var rotation: CGFloat
        
        recognizer=sender as! UIRotationGestureRecognizer
        rotation=recognizer.rotation
        imageView.transform = CGAffineTransformMakeRotation(0.0)
        
        feedback=String(format: "Rotated, Radians: %1.2f, Velocity: %1.2f",
            Float(recognizer.rotation),Float(recognizer.velocity))
        outputLabel.text=feedback
        imageView.transform = CGAffineTransformMakeRotation(rotation)
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        if motion==UIEventSubtype.MotionShake {
            outputLabel.text="Shaking things up!"
            imageView.transform=CGAffineTransformIdentity
            imageView.frame=originalRect
        }
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        originalRect=imageView.frame;
        var tempImageView: UIImageView
        tempImageView=UIImageView(image:UIImage(named: "flower.png"))
        tempImageView.frame=originalRect
        view.addSubview(tempImageView)
        self.imageView=tempImageView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

