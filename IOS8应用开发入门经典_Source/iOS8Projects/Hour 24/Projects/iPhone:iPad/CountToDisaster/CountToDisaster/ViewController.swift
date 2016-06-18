//
//  ViewController.swift
//  CountToDisaster
//
//  Created by John Ray on 12/6/14.
//  Copyright (c) 2014 John E. Ray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var theTimer: NSTimer?
    var theString: String = "It Begins..."

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        theTimer=NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "countUp", userInfo: nil, repeats: true)
    }
    
    func countUp() {
        theString=theString+theString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

