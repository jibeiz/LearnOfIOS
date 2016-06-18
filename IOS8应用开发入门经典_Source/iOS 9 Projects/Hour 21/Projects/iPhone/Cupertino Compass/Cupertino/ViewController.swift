//
//  ViewController.swift
//  Cupertino
//
//  Created by John Ray on 11/8/15.
//  Copyright © 2015 John E. Ray. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var waitView: UIView!
    @IBOutlet weak var distanceView: UIView!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var directionArrow: UIImageView!
    
    let locMan: CLLocationManager = CLLocationManager()
    var recentLocation: CLLocation!
    
    let kCupertinoLatitude: CLLocationDegrees = 37.3229978
    let kCupertinoLongitude: CLLocationDegrees = -122.0321823
    let kDeg2Rad: Double = 0.0174532925
    let kRad2Deg: Double = 57.2957795
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let newLocation: CLLocation=locations[0]
        if newLocation.horizontalAccuracy >= 0 {
            recentLocation=newLocation
            let cupertino:CLLocation = CLLocation(latitude: kCupertinoLatitude,longitude: kCupertinoLongitude)
            let delta:CLLocationDistance = cupertino.distanceFromLocation(newLocation)
            let miles: Double = (delta * 0.000621371) + 0.5 // meters to rounded miles
            if miles < 3 {
                // Stop updating the location and heading
                locMan.stopUpdatingLocation()
                locMan.stopUpdatingHeading()
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
    
    func locationManager(manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        if (recentLocation != nil && newHeading.headingAccuracy >= 0) {
            let cupertino:CLLocation = CLLocation(latitude: kCupertinoLatitude,longitude: kCupertinoLongitude)
            let course: Double = headingToLocation(cupertino.coordinate, current:recentLocation.coordinate)
            let delta: Double = newHeading.trueHeading - course
            if (abs(delta) <= 10) {
                directionArrow.image = UIImage(named: "up_arrow.png")
            } else {
                if (delta > 180) {
                    directionArrow.image = UIImage(named: "right_arrow.png")
                }
                else if (delta > 0) {
                    directionArrow.image = UIImage(named: "left_arrow.png")
                }
                else if (delta > -180) {
                    directionArrow.image = UIImage(named: "right_arrow.png")
                }
                else {
                    directionArrow.image = UIImage(named: "left_arrow.png")
                }
            }
            directionArrow.hidden = false
        } else {
            directionArrow.hidden = true
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        if error.code == CLError.Denied.rawValue {
            locMan.stopUpdatingLocation()
        } else {
            waitView.hidden = true
            distanceView.hidden = false
        }
    }
    
    func headingToLocation(desired: CLLocationCoordinate2D, current: CLLocationCoordinate2D) -> Double {
        // Gather the variables needed by the heading algorithm
        let lat1:Double = current.latitude*kDeg2Rad
        let lat2: Double = desired.latitude*kDeg2Rad
        let lon1: Double  = current.longitude
        let lon2: Double = desired.longitude
        let dlon: Double = (lon2-lon1)*kDeg2Rad
        
        let y: Double = sin(dlon)*cos(lat2)
        let x: Double = cos(lat1)*sin(lat2) - sin(lat1)*cos(lat2)*cos(dlon)
        
        var heading:Double = atan2(y,x)
        heading=heading*kRad2Deg
        heading=heading+360.0
        heading=fmod(heading,360.0)
        return heading
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locMan.delegate = self
        locMan.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locMan.distanceFilter = 1609; // a mile
        locMan.requestWhenInUseAuthorization()
        locMan.startUpdatingLocation()
        
        if CLLocationManager.headingAvailable() {
            locMan.headingFilter = 10 // 10 degrees
            locMan.startUpdatingHeading()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
}
