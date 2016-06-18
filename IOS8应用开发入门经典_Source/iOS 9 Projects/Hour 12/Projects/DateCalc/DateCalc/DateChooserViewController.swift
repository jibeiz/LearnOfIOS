//
//  DateChooserViewController.swift
//  DateCalc
//
//  Created by John Ray on 10/8/15.
//  Copyright © 2015 John E. Ray. All rights reserved.
//

import UIKit

class DateChooserViewController: UIViewController {

    @IBAction func setDateTime(sender: AnyObject) {
        (presentingViewController as! ViewController).calculateDateDifference((sender as! UIDatePicker).date)
    }
    
    @IBAction func dismissDateChooser(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        preferredContentSize = CGSizeMake(340,380)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        (presentingViewController as! ViewController).calculateDateDifference(NSDate())
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
