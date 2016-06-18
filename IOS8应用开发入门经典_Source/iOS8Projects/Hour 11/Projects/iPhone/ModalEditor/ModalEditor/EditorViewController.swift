//
//  EditorViewController.swift
//  ModalEditor
//
//  Created by John Ray on 11/12/14.
//  Copyright (c) 2014 John E. Ray. All rights reserved.
//

import UIKit

class EditorViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    @IBAction func updateEditor(sender: AnyObject) {
        (presentingViewController as ViewController).emailLabel.text=emailField.text
        //self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func hideKeyboard(sender: AnyObject) {
        emailField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        preferredContentSize = CGSizeMake(340,160)
    }
    
    override func viewWillAppear(animated: Bool) {
        emailField.text=(presentingViewController as ViewController).emailLabel.text
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
