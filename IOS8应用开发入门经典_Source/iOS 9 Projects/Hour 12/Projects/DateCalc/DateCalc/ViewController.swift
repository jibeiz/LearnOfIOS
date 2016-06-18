//
//  ViewController.swift
//  DateCalc
//
//  Created by John Ray on 10/8/15.
//  Copyright © 2015 John E. Ray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!

    func calculateDateDifference(chosenDate: NSDate) {
        
        //NSLog("%@",chosenDate)
        
        let todaysDate: NSDate = NSDate()
        let difference: NSTimeInterval = todaysDate.timeIntervalSinceDate(chosenDate) / 86400
        
        NSLog("%@",NSDate().timeIntervalSinceDate(NSDate.distantFuture() as NSDate))
        
        let dateFormat: NSDateFormatter = NSDateFormatter()
        dateFormat.dateFormat = "MMMM d, yyyy hh:mm:ssa"
        
        let todaysDateString: String = dateFormat.stringFromDate(todaysDate)
        let chosenDateString: String = dateFormat.stringFromDate(chosenDate)
        
        let differenceOutput: String = NSString(format: "Difference between chosen date (%@) and today (%@) in days: %1.2f", chosenDateString, todaysDateString, fabs(difference)) as String
        
        //let differenceOutput: String = "Difference between chosen date (\(chosenDateString)) and today (\(todaysDateString)) in days: \(Int(fabs(difference)))"
        
        outputLabel.text=differenceOutput
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

