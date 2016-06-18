//
//  ViewController.swift
//  Counting
//
//  Created by John Ray on 12/6/14.
//  Copyright (c) 2014 John E. Ray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        println("Starting my count...")
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

