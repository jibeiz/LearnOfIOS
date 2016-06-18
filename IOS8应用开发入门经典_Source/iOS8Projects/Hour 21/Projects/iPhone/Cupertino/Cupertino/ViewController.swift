//
//  ViewController.swift
//  Cupertino
//
//  Created by John Ray on 11/3/14.
//  Copyright (c) 2014 John E. Ray. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var waitView: UIView!
    @IBOutlet weak var distanceView: UIView!
    @IBOutlet weak var distanceLabel: UILabel!
    
    let locMan: CLLocationManager = CLLocationManager()
    //var oldLocation: CLLocation!
    
    let kCupertinoLatitude: CLLocationDegrees = 37.3229978
    let kCupertinoLongitude: CLLocationDegrees = -122.0321823
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        let newLocation: CLLocation=locations[0] as! CLLocation
        NSLog("Something is happening")
        if newLocation.horizontalAccuracy >= 0 {
            let Cupertino:CLLocation = CLLocation(latitude: kCupertinoLatitude,longitude: kCupertinoLongitude)
            let delta:CLLocationDistance = Cupertino.distanceFromLocation(newLocation)
            let miles: Double = (delta * 0.000621371) + 0.5 // meters to rounded miles
            if miles < 3 {
                // Stop updating the location
                locMan.stopUpdatingLocation()
                // Congratulate the user
                distanceLabel.text = "Enjoy the\nMothership!"
            } else {
                let commaDelimited: NSNumberFormatter = NSNumberFormatter()
                commaDelimited.numberStyle = NSNumberFormatterStyle.DecimalStyle
                distanceLabel.text=commaDelimited.stringFromNumber(miles)!+" miles to the\nMothership"
            }
            waitView.hidden = true
            distanceView.hidden = false
        }
       // oldLocation=locations[0] as CLLocation
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        if error.code == CLError.Denied.rawValue {
            locMan.stopUpdatingLocation()
        } else {
            waitView.hidden = true
            distanceView.hidden = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locMan.delegate = self
        locMan.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locMan.distanceFilter = 1609; // a mile
        locMan.requestWhenInUseAuthorization()
        locMan.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

}

