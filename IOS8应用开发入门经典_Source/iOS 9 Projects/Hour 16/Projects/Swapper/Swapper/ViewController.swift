//
//  ViewController.swift
//  Swapper
//
//  Created by John Ray on 10/28/15.
//  Copyright © 2015 John E. Ray. All rights reserved.
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

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.All
    }
    
    override func viewWillTransitionToSize(size: CGSize,
        withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
    
        if size.width > size.height {
            view = landscapeView
            view.frame=CGRectMake(0, 0, size.width, size.height)
        } else {
            view = portraitView
            view.frame=CGRectMake(0, 0, size.height, size.width)
        }
        
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        
    }

}

