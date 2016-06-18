//
//  ViewController.swift
//  AllInCode
//
//  Created by John Ray on 12/15/14.
//  Copyright (c) 2014 John E. Ray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let buttonA: UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
    let buttonB: UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
    let theLabel: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initInterface()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.All.rawValue)
    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        updateInterface()
    }

    func initInterface() {
        buttonA.addTarget(self, action: "handleButton:", forControlEvents: UIControlEvents.TouchUpInside)
        buttonA.setTitle("Button A", forState: UIControlState.Normal)
        
        buttonB.addTarget(self, action: "handleButton:", forControlEvents: UIControlEvents.TouchUpInside)
        buttonB.setTitle("Button B", forState: UIControlState.Normal)
        
        theLabel.text="Welcome"
        
        updateInterface()
    }
    
    func updateInterface() {
        let screenWidth: CGFloat = view.bounds.size.width;
        let screenHeight: CGFloat = view.bounds.size.height
        
        for subview in view.subviews {
            subview.removeFromSuperview()
        }
        
        if interfaceOrientation == UIInterfaceOrientation.Portrait ||
            interfaceOrientation == UIInterfaceOrientation.PortraitUpsideDown {
                buttonA.frame=CGRectMake(20.0,20.0,screenWidth-40.0,screenHeight/2-40.0)
                buttonB.frame=CGRectMake(20.0,screenHeight/2+20,screenWidth-40.0,screenHeight/2-40.0)
                theLabel.frame=CGRectMake(screenWidth/2-40,screenHeight/2-10,200.0,20.0)
        } else {
            buttonA.frame=CGRectMake(20.0,60.0,screenWidth-40.0,screenHeight/2-40.0)
            buttonB.frame=CGRectMake(20.0,screenHeight/2+30,screenWidth-40.0,screenHeight/2-40.0)
            theLabel.frame=CGRectMake(screenWidth/2-40,20.0,200.0,20.0)
        }
        
        view.addSubview(buttonA)
        view.addSubview(buttonB)
        view.addSubview(theLabel)
        
    }
    
    func handleButton(theButton: UIButton) {
        theLabel.text = theButton.currentTitle
    }
    

}

