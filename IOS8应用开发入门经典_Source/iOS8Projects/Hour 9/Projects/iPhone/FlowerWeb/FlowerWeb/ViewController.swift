//
//  ViewController.swift
//  FlowerWeb
//
//  Created by John Ray on 8/11/14.
//  Copyright (c) 2014 John Ray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colorChoice: UISegmentedControl!
    @IBOutlet weak var flowerView: UIWebView!
    @IBOutlet weak var flowerDetailView: UIWebView!
    //var blurView: UIVisualEffectView!
    @IBOutlet var blurView: UIVisualEffectView!
    
    @IBAction func getFlower(sender: AnyObject?) {
        var imageURL: NSURL
        var detailURL: NSURL
        var imageURLString: String
        var detailURLString: String
        var color: String
        let sessionID: Int=random()%50000
        
        color=colorChoice.titleForSegmentAtIndex(colorChoice.selectedSegmentIndex)!
        
        imageURLString =
            "http://www.floraphotographs.com/showrandomios.php?color=\(color)&session=\(sessionID)"
        detailURLString =
            "http://www.floraphotographs.com/detailios.php?session=\(sessionID)"
        
        imageURL=NSURL(string: imageURLString)!
        detailURL=NSURL(string: detailURLString)!
        
        flowerView.loadRequest(NSURLRequest(URL: imageURL))
        flowerDetailView.loadRequest(NSURLRequest(URL: detailURL))
    }
    
    @IBAction func toggleFlowerDetail(sender: AnyObject) {
        flowerDetailView.hidden = !(sender as UISwitch).on
        blurView.hidden = !(sender as UISwitch).on
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        flowerDetailView.hidden=true
        getFlower(nil)
        
        blurView.hidden = true
        
        /*
        let blur:UIBlurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
    
        blurView = UIVisualEffectView (effect: blur)
        blurView.frame = flowerDetailView.frame
        blurView.hidden = true
        self.view.insertSubview(blurView, belowSubview: flowerDetailView)*/
        
        
        // Must make the AnyObject optional

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

