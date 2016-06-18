// Playground - noun: a place where people can play

import UIKit
import CoreLocation
import XCPlayground

XCPSetExecutionShouldContinueIndefinitely()

let geocoder: CLGeocoder = CLGeocoder()
let myAddress: String="Wakeman, OH"

geocoder.geocodeAddressString(myAddress,
    completionHandler: { (placemarks: [AnyObject]!, error: NSError!) -> Void in
    
    if error == nil {
        let myCoordinates:CLPlacemark=placemarks[0] as CLPlacemark
        myCoordinates.location.coordinate.latitude
        myCoordinates.location.coordinate.longitude
    } else {
        println(error.localizedDescription)
    }
    
})

