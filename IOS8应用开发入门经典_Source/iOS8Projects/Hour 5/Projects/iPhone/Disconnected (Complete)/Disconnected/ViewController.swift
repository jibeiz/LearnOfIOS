//
//  ViewController.swift
//  Disconnected
//
//  Created by John Ray on 9/25/14.
//  Copyright (c) 2014 John Ray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colorChoice: UISegmentedControl!
    @IBOutlet weak var flowerView: UIWebView!
    @IBOutlet weak var chosenColor: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getFlower(sender: AnyObject?) {
        var outputHTML: String
        var color: String
        var colorVal: String
        var colorNum=colorChoice.selectedSegmentIndex
        switch (colorNum) {
        case 0:
            color="Red"
            colorVal="red"
            break
        case 1:
            color="Blue"
            colorVal="blue"
            break
        case 2:
            color="Yellow"
            colorVal="yellow"
            break
        case 3:
            color="Green"
            colorVal="green"
            break
        default:
            color="Red"
            colorVal="red"
        }
        chosenColor.text=color
        outputHTML="<body style='margin: 0px; padding: 0px'><img height='2000' src='http://www.floraphotographs.com/showrandom.php?color=\(colorVal)'></body>"
        flowerView.loadHTMLString(outputHTML,baseURL: nil)
    }


}

