//
//  ViewController.swift
//  FlowerWeb
//
//  Created by John Ray on 9/25/15.
//  Copyright © 2015 John E. Ray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colorChoice: UISegmentedControl!
    @IBOutlet weak var flowerView: UIWebView!
    @IBOutlet weak var flowerDetailView: UIWebView!
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    @IBAction func getFlower(sender: AnyObject?) {
        var imageURL: NSURL
        var detailURL: NSURL
        var imageURLString: String
        var detailURLString: String
        var color: String
        let sessionID: Int=random()%50000
        
        color=colorChoice.titleForSegmentAtIndex(colorChoice.selectedSegmentIndex)!
        
        imageURLString =
            "https://teachyourselfios.info/?hour=9&color=\(color)&session=\(sessionID)"
        detailURLString =
            "https://teachyourselfios.info/?hour=9&session=\(sessionID)&type=detail"
        
        imageURL=NSURL(string: imageURLString)!
        detailURL=NSURL(string: detailURLString)!
        
        flowerView.loadRequest(NSURLRequest(URL: imageURL))
        flowerDetailView.loadRequest(NSURLRequest(URL: detailURL))
    }
    
    @IBAction func toggleFlowerDetail(sender: AnyObject) {
        flowerDetailView.hidden = !(sender as! UISwitch).on
        blurView.hidden = !(sender as! UISwitch).on
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        flowerDetailView.hidden=true
        getFlower(nil)
        blurView.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

