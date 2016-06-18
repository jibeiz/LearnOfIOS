//
//  GenericViewController.swift
//  LetsTab
//
//  Created by John Ray on 10/15/14.
//  Copyright (c) 2014 John E. Ray. All rights reserved.
//

import UIKit

class GenericViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var barItem: UITabBarItem!
    
    @IBAction func incrementCountFirst(sender: AnyObject) {
        (parentViewController as CountingTabBarController).firstCount++
        updateBadge()
        updateCounts()
    }
    
    @IBAction func incrementCountSecond(sender: AnyObject) {
        (parentViewController as CountingTabBarController).secondCount++
        updateBadge()
        updateCounts()
    }
    
    @IBAction func incrementCountThird(sender: AnyObject) {
        (parentViewController as CountingTabBarController).thirdCount++
        updateBadge()
        updateCounts()
    }
    
    func updateBadge() {
        var badgeCount: Int
        if (barItem.badgeValue != nil) {
            badgeCount = barItem.badgeValue!.toInt()!
            badgeCount++
            barItem.badgeValue=String(badgeCount)
        } else {
            barItem.badgeValue="1"
        }
    }
    
    func updateCounts() {
        let first=(parentViewController as CountingTabBarController).firstCount
        let second=(parentViewController as CountingTabBarController).secondCount
        let third=(parentViewController as CountingTabBarController).thirdCount
        self.outputLabel.text="First: \(first) \nSecond: \(second) \nThird: \(third)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updateCounts()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
