//
//  ViewController.swift
//  BestFriend
//
//  Created by John Ray on 11/10/15.
//  Copyright © 2015 John E. Ray. All rights reserved.
//

//
//  ViewController.swift
//  BestFriend
//
//  Created by John Ray on 11/5/14.
//  Copyright (c) 2014 John E. Ray. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import MessageUI
import Social
import Contacts
import ContactsUI
import SafariServices

class ViewController: UIViewController, CNContactPickerDelegate, MFMailComposeViewControllerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var web: UIButton!
    
    let locMan:CLLocationManager=CLLocationManager()
    
    @IBAction func openWeb(sender: AnyObject) {
        let safariController =
        SFSafariViewController(URL: NSURL(string:
            web.titleForState(UIControlState.Normal)!)!)
        self.presentViewController(safariController,
            animated: true, completion: nil)
    }
    
    @IBAction func newBFF(sender: AnyObject) {
        let picker: CNContactPickerViewController = CNContactPickerViewController()
        picker.delegate = self
        presentViewController(picker, animated: true, completion: nil)
    }
    
    @IBAction func sendEmail(sender: AnyObject) {
        let emailAddresses:[String]=[self.email.text!]
        let mailComposer:MFMailComposeViewController =
        MFMailComposeViewController()
        mailComposer.mailComposeDelegate=self;
        mailComposer.setToRecipients(emailAddresses)
        
        presentViewController(mailComposer, animated: true, completion: nil)
    }
    
    func mailComposeController(controller: MFMailComposeViewController,
        didFinishWithResult result: MFMailComposeResult, error: NSError?) {
            dismissViewControllerAnimated(true, completion: nil)
    }
    
    func contactPicker(picker: CNContactPickerViewController,
        didSelectContact contact: CNContact) {
            name.text = "\(contact.givenName) \(contact.familyName)"
            email.text = contact.emailAddresses.first!.value as? String
            if contact.imageDataAvailable {
                photo.image = UIImage(data: contact.imageData!)
            }
            showAddress(contact.postalAddresses.first!.value as! CNPostalAddress)
            web.setTitle(contact.urlAddresses.first!.value as? String, forState: UIControlState.Normal)
    }
    
    
    func showAddress(fullAddress:CNPostalAddress) {
        let addressString: String = "\(fullAddress.street),\(fullAddress.city),\(fullAddress.state),\(fullAddress.postalCode)"
        let geocoder: CLGeocoder = CLGeocoder()
        geocoder.geocodeAddressString(addressString, completionHandler:
            {(placemarks: [CLPlacemark]?, error: NSError?) -> Void in
                let friendPlacemark:CLPlacemark = placemarks![0]
                let mapRegion:MKCoordinateRegion =
                MKCoordinateRegion(center: friendPlacemark.location!.coordinate,
                    span: MKCoordinateSpanMake(0.2, 0.2))
                self.map.setRegion(mapRegion, animated: true)
                let mapPlacemark: MKPlacemark = MKPlacemark(placemark: friendPlacemark)
                self.map.addAnnotation(mapPlacemark)
        })
        
    }
    
    func mapView(aMapView: MKMapView,
        viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
            let pinDrop:MKPinAnnotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "myspot")
            pinDrop.animatesDrop=true
            pinDrop.canShowCallout=true
            pinDrop.pinTintColor=UIColor.blueColor()
            return pinDrop
    }
    
    
    
    @IBAction func sendTweet(sender: AnyObject) {
        let geocoder: CLGeocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(map.userLocation.location!, completionHandler:
            {(placemarks: [CLPlacemark]?, error: NSError?) -> Void in
                let myPlacemark:CLPlacemark = placemarks![0]
                let tweetText:String =
                "Hello all - I'm currently in \(myPlacemark.locality!)!"
                
                let tweetComposer: SLComposeViewController =
                SLComposeViewController(forServiceType: SLServiceTypeTwitter)
                
                if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
                    tweetComposer.setInitialText(tweetText)
                    self.presentViewController(tweetComposer, animated: true, completion: nil)
                }
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locMan.requestWhenInUseAuthorization()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    
}

