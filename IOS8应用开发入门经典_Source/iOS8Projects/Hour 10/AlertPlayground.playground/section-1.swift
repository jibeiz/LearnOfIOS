// Playground - noun: a place where people can play

import UIKit
import XCPlayground

let alertController = UIAlertController(title: "Do Something",
    message: "Please choose an action:",
    preferredStyle: UIAlertControllerStyle.ActionSheet)

let defaultAction = UIAlertAction(title: "Send Memo",
    style: UIAlertActionStyle.Default,
    handler: {(alertAction: UIAlertAction!) in
        // The user touched Send Memo
})

let destructiveAction = UIAlertAction(title: "Erase My Device",
    style: UIAlertActionStyle.Destructive,
    handler: {(alertAction: UIAlertAction!) in
        // The user wants us to erase the device. Oh well!
})

let cancelAction = UIAlertAction(title: "Cancel",
    style: UIAlertActionStyle.Cancel,
    handler: nil)

alertController.addAction(defaultAction)
alertController.addAction(destructiveAction)
alertController.addAction(cancelAction)

XCPShowView("Alert", alertController.view)




