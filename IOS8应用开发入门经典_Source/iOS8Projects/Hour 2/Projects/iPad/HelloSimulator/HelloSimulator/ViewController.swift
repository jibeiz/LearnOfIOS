//
//  ViewController.swift
//  HelloSimulator
//
//  Created by John Ray on 10/4/14.
//  Copyright (c) 2014 John Ray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        webView.loadHTMLString("<html><body style='width:100%;text-align: center; font-family: Helvetica; font-size:72px; margin-right:0px; margin-left:0px; margin-top:50px;'>Hello<br/> iOS Simulator<br/><br/><img style='width:100%' src='http://www.floraphotographs.com/showrandom.php'></body></html>",baseURL:nil);
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        var alertDialog:UIAlertView
        alertDialog=UIAlertView(title: "Stop shaking me!!!", message: "I'm about to get seasick!", delegate: nil, cancelButtonTitle: "Ok")
        alertDialog.show()
    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        webView.loadHTMLString("<html><body style='width:100%;text-align: center; font-family: Helvetica; font-size:72px; margin-right:0px; margin-left:0px; margin-top:50px;'>Hello<br/> iOS Simulator<br/><br/><img style='width:100%' src='http://www.floraphotographs.com/showrandom.php'></body></html>",baseURL:nil);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        var alertDialog:UIAlertView
        alertDialog=UIAlertView(title: "Where did my memory go?", message: "I'm losing my mind!", delegate: nil, cancelButtonTitle: "Forget stuff")
        alertDialog.show()
    }


}

