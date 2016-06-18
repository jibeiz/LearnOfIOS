//
//  ViewController.swift
//  CustomPicker
//
//  Created by John Ray on 10/8/15.
//  Copyright © 2015 John E. Ray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayAnimal(chosenAnimal: String, withSound chosenSound:String, fromComponent chosenComponent: String) {
        outputLabel.text = "You changed \(chosenComponent) (\(chosenAnimal) and the sound \(chosenSound))"
    }


}

