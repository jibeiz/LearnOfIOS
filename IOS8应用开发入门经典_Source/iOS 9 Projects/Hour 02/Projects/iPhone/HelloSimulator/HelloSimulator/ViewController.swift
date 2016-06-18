//
//  ViewController.swift
//  HelloSimulator
//
//  Created by John Ray on 8/28/15.
//  Copyright © 2015 John E. Ray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.loadHTMLString("<html><body style='width:100%;text-align: center; font-family: Helvetica; font-size:72px; margin-right:0px; margin-left:0px; margin-top:50px;'>Hello<br/> iOS Simulator<br/><br/><img style='width:100%' src='http://www.floraphotographs.com/showrandom.php'></body></html>",baseURL:nil);
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        let alertController = UIAlertController(title: "Stop shaking me!!!",
            message: "I'm about to get seasick!",
            preferredStyle: UIAlertControllerStyle.Alert)
        
        let defaultAction = UIAlertAction(title: "Ok",
            style: UIAlertActionStyle.Cancel,
            handler: nil)
        
        alertController.addAction(defaultAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        webView.loadHTMLString("<html><body style='width:100%;text-align: center; font-family: Helvetica; font-size:72px; margin-right:0px; margin-left:0px; margin-top:50px;'>Hello<br/> iOS Simulator<br/><br/><img style='width:100%' src='http://www.floraphotographs.com/showrandom.php'></body></html>",baseURL:nil);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        let alertController = UIAlertController(title: "Where did my memory go?",
            message: "I'm losing my mind!",
            preferredStyle: UIAlertControllerStyle.Alert)
        
        let defaultAction = UIAlertAction(title: "Ok",
            style: UIAlertActionStyle.Cancel,
            handler: nil)
        
        alertController.addAction(defaultAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }


}

