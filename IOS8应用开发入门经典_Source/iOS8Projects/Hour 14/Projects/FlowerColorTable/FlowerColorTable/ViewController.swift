//
//  ViewController.swift
//  FlowerColorTable
//
//  Created by John Ray on 12/1/14.
//  Copyright (c) 2014 John E. Ray. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let kSectionCount:Int = 2
    let kRedSection: Int = 0
    let kBlueSection: Int = 1
    
    let redFlowers: [String] = ["Gerbera","Peony","Rose","Poppy"]
    let blueFlowers: [String] = ["Hyacinth","Hydrangea","Sea Holly","Phlox","Iris"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("flowerCell") as UITableViewCell
        switch (indexPath.section) {
            case kRedSection:
                cell.textLabel!.text=redFlowers[indexPath.row]
            case kBlueSection:
                cell.textLabel!.text=blueFlowers[indexPath.row]
            default:
                cell.textLabel!.text="Unknown"
        }
        
        let flowerImage: UIImage=UIImage(named: cell.textLabel!.text!)!
        cell.imageView!.image=flowerImage
        return cell
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return kSectionCount
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
            case kRedSection:
                return "Red"
            case kBlueSection:
                return "Blue"
            default:
                return "Unknown"
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case kRedSection:
                return redFlowers.count
            case kBlueSection:
                return blueFlowers.count
            default:
                return 0
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var flowerMessage: String
        switch indexPath.section {
            case kRedSection:
                flowerMessage = "You chose the red flower - \(redFlowers[indexPath.row])"
            case kBlueSection:
                flowerMessage = "You chose the blue flower - \(blueFlowers[indexPath.row])"
            default:
                flowerMessage = "I have no idea what you chose?!"
        }
        
        let alertController = UIAlertController(title: "Flower Selected",
            message: flowerMessage,
            preferredStyle: UIAlertControllerStyle.Alert)
        
        let defaultAction = UIAlertAction(title: "Ok",
            style: UIAlertActionStyle.Cancel,
            handler: nil)
        
        alertController.addAction(defaultAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
}

