//
//  ViewController.swift
//  ModalEditor
//
//  Created by John Ray on 10/5/15.
//  Copyright © 2015 John E. Ray. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var emailLabel: UILabel!
    
    @IBAction func exitToHere(sender: UIStoryboardSegue) {
        // No code needed!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationViewController:EditorViewController =
        segue.destinationViewController as! EditorViewController
        destinationViewController.popoverPresentationController!.delegate=self
    }
    
    
    func adaptivePresentationStyleForPresentationController(controller:
        UIPresentationController) -> UIModalPresentationStyle {
            return UIModalPresentationStyle.None
    }


}

