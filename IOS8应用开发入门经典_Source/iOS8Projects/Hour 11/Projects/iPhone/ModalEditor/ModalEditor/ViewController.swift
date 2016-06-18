//
//  ViewController.swift
//  ModalEditor
//
//  Created by John Ray on 11/12/14.
//  Copyright (c) 2014 John E. Ray. All rights reserved.
//

import UIKit

class ViewController: UIViewController { //, UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var emailLabel: UILabel!
    
    @IBAction func exitToHere(sender: UIStoryboardSegue) {
        // No code needed!
    }
    
    
 /*   func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .OverFullScreen
    } */
    
    override func viewDidLoad() {
        super.viewDidLoad()
 //       popoverPresentationController?.delegate=self
 //       modalPresentationStyle = .Popover
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

