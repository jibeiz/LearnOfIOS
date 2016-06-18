//
//  ViewController.swift
//  Swapper
//
//  Created by John Ray on 12/15/14.
//  Copyright (c) 2014 John E. Ray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var portraitView: UIView!
    @IBOutlet var landscapeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.All.rawValue)
    }
    

    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {

        if interfaceOrientation == UIInterfaceOrientation.LandscapeRight {
            view = landscapeView
        } else if interfaceOrientation == UIInterfaceOrientation.LandscapeLeft {
            view = landscapeView
        } else {
            view = portraitView
        }
        
        view.frame=UIScreen.mainScreen().bounds
    }

}

