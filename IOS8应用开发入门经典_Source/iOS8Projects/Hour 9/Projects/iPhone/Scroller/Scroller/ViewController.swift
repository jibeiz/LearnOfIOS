//
//  ViewController.swift
//  Scroller
//
//  Created by John Ray on 8/18/14.
//  Copyright (c) 2014 John Ray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var theScroller: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        theScroller.contentSize=CGSizeMake(300.0,1000.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

