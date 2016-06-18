//
//  ViewController.swift
//  ColorTilt
//
//  Created by John Ray on 10/22/14.
//  Copyright (c) 2014 John E. Ray. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    let kRad2Deg:Double = 57.2957795
    
    @IBOutlet weak var toggleMotion: UISwitch!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var toggleAccelerometer: UISwitch!
    @IBOutlet weak var toggleGyroscope: UISwitch!
    @IBOutlet weak var rollOutput: UILabel!
    @IBOutlet weak var pitchOutput: UILabel!
    @IBOutlet weak var yawOutput: UILabel!
    
    var motionManager: CMMotionManager = CMMotionManager()
    
    @IBAction func controlHardware(sender: AnyObject) {
        if toggleMotion.on {
            motionManager.startDeviceMotionUpdatesToQueue(NSOperationQueue.currentQueue(), withHandler: {
                (motion: CMDeviceMotion!, error: NSError!) in
                    self.doAttitude(motion.attitude)
                    if self.toggleAccelerometer.on {
                        self.doAcceleration(motion.userAcceleration)
                    }
                    if self.toggleGyroscope.on {
                        self.doRotation(motion.rotationRate)
                    }
                })
        } else {
            toggleGyroscope.on=false
            toggleAccelerometer.on=false
            motionManager.stopDeviceMotionUpdates()
        }
    }
    
    func doAttitude(attitude: CMAttitude) {
        rollOutput.text=String(format:"%.0f",attitude.roll*kRad2Deg)
        pitchOutput.text=String(format:"%.0f",attitude.pitch*kRad2Deg)
        yawOutput.text=String(format:"%.0f",attitude.yaw*kRad2Deg)
        if !toggleGyroscope.on {
            colorView.alpha=CGFloat(fabs(attitude.pitch))
        }
    }
    
    func doAcceleration(acceleration: CMAcceleration) {
        if (acceleration.x > 1.3) {
            colorView.backgroundColor = UIColor.greenColor()
        } else if (acceleration.x < -1.3) {
            colorView.backgroundColor = UIColor.orangeColor()
        } else if (acceleration.y > 1.3) {
            colorView.backgroundColor = UIColor.redColor()
        } else if (acceleration.y < -1.3) {
            colorView.backgroundColor = UIColor.blueColor()
        } else if (acceleration.z > 1.3) {
            colorView.backgroundColor = UIColor.yellowColor()
        } else if (acceleration.z < -1.3) {
            colorView.backgroundColor = UIColor.purpleColor()
        }
    }
    
    func doRotation(rotation: CMRotationRate) {
        var value: Double = fabs(rotation.x)+fabs(rotation.y)+fabs(rotation.z)/12.5;
        if (value > 1.0) { value = 1.0;}
        colorView.alpha = CGFloat(value)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

