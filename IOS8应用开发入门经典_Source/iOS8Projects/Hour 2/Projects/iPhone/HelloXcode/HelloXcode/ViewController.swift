//
//  ViewController.swift
//  HelloXcode
//
//  Created by John Ray on 9/22/14.
//  Copyright (c) 2014 John Ray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var myMessage: UILabel
        var myUnusedVariable: String
        myMessage=UILabel(frame:CGRectMake(30.0,50.0,300.0,50.0))
        myMessage.font=UIFont.systemFontOfSize(48.0)
        myMessage.text="Hello Xcode"
        myMessage.textColor=UIColor(patternImage: UIImage(named:"Background")!)
        view.addSubview(myMessage)
        NSLog("Hello Xcode, Again")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

