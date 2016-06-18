//
//  ViewController.swift
//  Counting
//
//  Created by John Ray on 10/23/15.
//  Copyright © 2015 John E. Ray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Starting my count...")
        for var x=0;x<500;x++ {
            NSLog("Counting: \(x)")
        }
        NSLog("All done!")
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

