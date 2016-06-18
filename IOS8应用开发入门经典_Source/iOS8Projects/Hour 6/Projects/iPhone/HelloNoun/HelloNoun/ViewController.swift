//
//  ViewController.swift
//  HelloNoun
//
//  Created by John Ray on 8/3/14.
//  Copyright (c) 2014 John Ray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var userOutput: UILabel!
                            
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

