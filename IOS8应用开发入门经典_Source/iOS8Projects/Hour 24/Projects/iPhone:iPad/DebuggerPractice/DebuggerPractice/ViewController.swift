//
//  ViewController.swift
//  DebuggerPractice
//
//  Created by John Ray on 12/6/14.
//  Copyright (c) 2014 John E. Ray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var description: String
        
        NSLog("Start")
        for var i=1;i<=2000;i++ {
            description=describeInteger(i)
            NSLog("Variables i = \(i) and description = \(description)")
            NSLog("-----")
        }
        NSLog("Done")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func describeInteger(i: Int) -> String {
        if i % 2 == 0 {
            return "even"
        } else {
            return "odd"
        }
    }

}

