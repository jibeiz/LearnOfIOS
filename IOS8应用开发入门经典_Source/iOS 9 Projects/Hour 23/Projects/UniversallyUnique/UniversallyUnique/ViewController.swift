//
//  ViewController.swift
//  UniversallyUnique
//
//  Created by John Ray on 12/17/15.
//  Copyright (c) 2015 John E. Ray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let currentDevice: UIDevice = UIDevice.currentDevice()
        var outputString: String = "I look like an "
        
        if UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad {
            outputString = outputString + "iPad "
        } else {
            outputString = outputString + "iPhone "
        }
        outputString = outputString + "(\(currentDevice.model))"
        
        outputLabel.text = outputString
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

