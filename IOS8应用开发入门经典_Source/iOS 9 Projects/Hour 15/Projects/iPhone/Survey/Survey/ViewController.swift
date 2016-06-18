//
//  ViewController.swift
//  Survey
//
//  Created by John Ray on 10/18/15.
//  Copyright © 2015 John E. Ray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultsView: UITextView!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    
    @IBAction func storeSurvey(sender: AnyObject) {
        let csvLine:String="\(firstName.text!),\(lastName.text!),\(email.text!)\n"
        let paths = NSSearchPathForDirectoriesInDomains(
            NSSearchPathDirectory.DocumentDirectory,
            NSSearchPathDomainMask.UserDomainMask, true)
        let docDir:String=paths[0]
        let surveyFile:String=(docDir as NSString).stringByAppendingPathComponent("surveyresults.csv")
        
        if !NSFileManager.defaultManager().fileExistsAtPath(surveyFile) {
            NSFileManager.defaultManager().createFileAtPath(surveyFile,
                contents: nil, attributes: nil)
        }
        
        let fileHandle:NSFileHandle=NSFileHandle(forUpdatingAtPath:surveyFile)!
        fileHandle.seekToEndOfFile()
        fileHandle.writeData(csvLine.dataUsingEncoding(NSUTF8StringEncoding)!)
        fileHandle.closeFile()
        
        firstName.text=""
        lastName.text=""
        email.text=""
        
    }
    
    @IBAction func showResults(sender: AnyObject) {
        let paths = NSSearchPathForDirectoriesInDomains(
            NSSearchPathDirectory.DocumentDirectory,
            NSSearchPathDomainMask.UserDomainMask, true)
        let docDir:String=paths[0] as String
        let surveyFile:String=(docDir as NSString).stringByAppendingPathComponent("surveyresults.csv")
        
        if NSFileManager.defaultManager().fileExistsAtPath(surveyFile) {
            let fileHandle:NSFileHandle=NSFileHandle(forReadingAtPath:surveyFile)!
            let surveyResults:String=NSString(data: fileHandle.availableData, encoding: NSUTF8StringEncoding)! as String
            fileHandle.closeFile()
            resultsView.text=surveyResults
        }
    }
    
    @IBAction func hideKeyboard(sender: AnyObject) {
        firstName.resignFirstResponder()
        lastName.resignFirstResponder()
        email.resignFirstResponder()
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

