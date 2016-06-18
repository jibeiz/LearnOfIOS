//
//  ViewController.swift
//  HelloNoun
//
//  Created by John Ray on 9/14/15.
//  Copyright © 2015 John E. Ray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userOutput: UILabel!
    @IBOutlet weak var userInput: UITextField!
    
    
    @IBAction func setOutput(sender: AnyObject) {
        userOutput.text=userInput.text
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

