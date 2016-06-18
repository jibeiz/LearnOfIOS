//
//  ViewController.swift
//  AllInCode
//
//  Created by John Ray on 10/28/15.
//  Copyright © 2015 John E. Ray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let buttonA: UIButton = UIButton(type: UIButtonType.System)
    let buttonB: UIButton = UIButton(type: UIButtonType.System)
    let theLabel: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initInterface()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.All
    }
    
    override func viewWillTransitionToSize(size: CGSize,
        withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
            
        super.viewWillTransitionToSize(size,
            withTransitionCoordinator: coordinator)
            
        updateLayoutWithScreenWidth(size.width, screenHeight: size.height)
    }
    
    func initInterface() {
        buttonA.addTarget(self, action: "handleButton:",
            forControlEvents: UIControlEvents.TouchUpInside)
        buttonA.setTitle("Button A", forState: UIControlState.Normal)
        
        buttonB.addTarget(self, action: "handleButton:",
            forControlEvents: UIControlEvents.TouchUpInside)
        buttonB.setTitle("Button B", forState: UIControlState.Normal)
        
        theLabel.text="Welcome"
        
        let screenWidth: CGFloat = view.bounds.size.width
        let screenHeight: CGFloat = view.bounds.size.height
        
        updateLayoutWithScreenWidth(screenWidth,
            screenHeight: screenHeight)

        view.addSubview(buttonA)
        view.addSubview(buttonB)
        view.addSubview(theLabel)
    }
    
    func updateLayoutWithScreenWidth(screenWidth:CGFloat,
        screenHeight:CGFloat) {
            
        if screenWidth>screenHeight {
            buttonA.frame=CGRectMake(20.0,60.0,
                screenWidth-40.0,screenHeight/2-40.0)
            buttonB.frame=CGRectMake(20.0,screenHeight/2+30,
                screenWidth-40.0,screenHeight/2-40.0)
            theLabel.frame=CGRectMake(screenWidth/2-40,20.0,
                200.0,20.0)
        } else {
            buttonA.frame=CGRectMake(20.0,20.0,
                screenWidth-40.0,screenHeight/2-40.0)
            buttonB.frame=CGRectMake(20.0,
                screenHeight/2+20,screenWidth-40.0,screenHeight/2-40.0)
            theLabel.frame=CGRectMake(screenWidth/2-40,screenHeight/2-10,
                200.0,20.0)
        }
    }

    func handleButton(theButton: UIButton) {
        theLabel.text = theButton.currentTitle
    }

}

