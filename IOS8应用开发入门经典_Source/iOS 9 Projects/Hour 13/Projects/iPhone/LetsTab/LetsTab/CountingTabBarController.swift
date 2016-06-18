//
//  CountingTabBarController.swift
//  LetsTab
//
//  Created by John Ray on 10/9/15.
//  Copyright © 2015 John E. Ray. All rights reserved.
//

import UIKit

class CountingTabBarController: UITabBarController {
    
    var firstCount: Int = 0
    var secondCount: Int = 0
    var thirdCount: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
