//
//  ViewController.swift
//  BestFriend
//
//  Created by John Ray on 11/5/14.
//  Copyright (c) 2014 John E. Ray. All rights reserved.
//

import UIKit
import AddressBook
import AddressBookUI
import MapKit
import CoreLocation
import MessageUI
import Social

class ViewController: UIViewController, ABPeoplePickerNavigationControllerDelegate, MFMailComposeViewControllerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var map: MKMapView!
    
    let locMan:CLLocationManager=CLLocationManager()
    
    // Blurring Code
    @IBOutlet weak var labelBackground: UIView!
    var backgroundBlur: UIVisualEffectView!

    
    @IBAction func newBFF(sender: AnyObject) {
        let picker: ABPeoplePickerNavigationController =
            ABPeoplePickerNavigationController()
        picker.peoplePickerDelegate = self
        presentViewController(picker, animated: true, completion: nil)
    }
    
    @IBAction func sendEmail(sender: AnyObject) {
        var emailAddresses:[String]=[self.email.text!]
        var mailComposer:MFMailComposeViewController =
            MFMailComposeViewController()
        mailComposer.mailComposeDelegate=self;
        mailComposer.setToRecipients(emailAddresses)
        
        presentViewController(mailComposer, animated: true, completion: nil)
    }
    
    func mailComposeController(controller: MFMailComposeViewController!,
        didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func peoplePickerNavigationController(peoplePicker: ABPeoplePickerNavigationController!, didSelectPerson person: ABRecord!) {
        
        let friendName:String = ABRecordCopyValue(person, kABPersonFirstNameProperty).takeRetainedValue() as String as String
        name.text=friendName
        
        let friendAddressSet:ABMultiValueRef = ABRecordCopyValue(person, kABPersonAddressProperty).takeRetainedValue()
        
        if ABMultiValueGetCount(friendAddressSet)>0 {
            let friendFirstAddress: Dictionary = ABMultiValueCopyValueAtIndex(friendAddressSet, 0).takeRetainedValue() as NSDictionary
            showAddress(friendFirstAddress)
        }
        
        let friendEmailAddresses:ABMultiValueRef = ABRecordCopyValue(person, kABPersonEmailProperty).takeRetainedValue()
        
        if ABMultiValueGetCount(friendEmailAddresses)>0 {
            let friendEmail: String = ABMultiValueCopyValueAtIndex(friendEmailAddresses, 0).takeRetainedValue() as String
            email.text=friendEmail
        }
        
        if ABPersonHasImageData(person) {
            photo.image = UIImage(data: ABPersonCopyImageData(person).takeRetainedValue())
        }
    }
    
    func showAddress(fullAddress:NSDictionary) {
        let geocoder: CLGeocoder = CLGeocoder()
        geocoder.geocodeAddressDictionary(fullAddress, completionHandler:
            {(placemarks: [AnyObject]!, error: NSError!) -> Void in
                let friendPlacemark:CLPlacemark = placemarks[0] as CLPlacemark
                let mapRegion:MKCoordinateRegion =
                    MKCoordinateRegion(center: friendPlacemark.location.coordinate,
                        span: MKCoordinateSpanMake(0.2, 0.2))
                self.map.setRegion(mapRegion, animated: true)
                let mapPlacemark: MKPlacemark = MKPlacemark(placemark: friendPlacemark)
                self.map.addAnnotation(mapPlacemark)
        })
    }
    
    func mapView(aMapView: MKMapView!,
        viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
            let pinDrop:MKPinAnnotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "myspot")
            pinDrop.animatesDrop=true
            pinDrop.canShowCallout=true
            pinDrop.pinColor=MKPinAnnotationColor.Purple
            return pinDrop
    }
    
    
    /*
- (MKAnnotationView *)mapView:(MKMapView *)mapView
viewForAnnotation:(id <MKAnnotation>)annotation {
MKPinAnnotationView *pinDrop=[[MKPinAnnotationView alloc]
initWithAnnotation:annotation
reuseIdentifier:@"myspot"];
pinDrop.animatesDrop=YES;
pinDrop.canShowCallout=YES;
pinDrop.pinColor=MKPinAnnotationColorPurple;
return pinDrop;
}
*/



    @IBAction func sendTweet(sender: AnyObject) {
        let geocoder: CLGeocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(map.userLocation.location, completionHandler:
            {(placemarks: [AnyObject]!, error: NSError!) -> Void in
                let myPlacemark:CLPlacemark = placemarks[0] as CLPlacemark
                let tweetText:String =
                    "Hello all - I'm currently in \(myPlacemark.locality)!"
                
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
        //let locMan:CLLocationManager=CLLocationManager()
        locMan.requestWhenInUseAuthorization()
        
        let blur: UIBlurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        backgroundBlur = UIVisualEffectView (effect: blur)
        backgroundBlur.frame = labelBackground.frame
        view.insertSubview(backgroundBlur, belowSubview: labelBackground)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }


}

