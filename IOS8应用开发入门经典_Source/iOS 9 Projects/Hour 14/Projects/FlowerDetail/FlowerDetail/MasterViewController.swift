//
//  MasterViewController.swift
//  FlowerDetail
//
//  Created by John Ray on 10/13/15.
//  Copyright © 2015 John E. Ray. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [AnyObject]()

    var flowerData: [AnyObject] = []
    var flowerSections: [String] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createFlowerData()
        
        //self.navigationItem.leftBarButtonItem = self.editButtonItem()

        //let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        //self.navigationItem.rightBarButtonItem = addButton
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insertNewObject(sender: AnyObject) {
        objects.insert(NSDate(), atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                //let object = objects[indexPath.row] as! NSDate
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                //controller.detailItem = object
                controller.detailItem=self.flowerData[indexPath.section][indexPath.row]
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return flowerSections.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flowerData[section].count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("flowerCell", forIndexPath: indexPath)

        //let object = objects[indexPath.row] as! NSDate
        //cell.textLabel!.text = object.description
        
        cell.textLabel!.text = flowerData[indexPath.section][indexPath.row]["name"] as! String!
        cell.detailTextLabel!.text = flowerData[indexPath.section][indexPath.row]["url"] as! String!
        
        cell.imageView!.image = UIImage(named: flowerData[indexPath.section][indexPath.row]["picture"] as! String!)!

        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return flowerSections[section]
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            objects.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    func createFlowerData() {
        var redFlowers: [Dictionary<String,String>] = []
        var blueFlowers: [Dictionary<String,String>] = []
        
        flowerSections = ["Red Flowers","Blue Flowers"]
        
        redFlowers.append(["name":"Poppy","picture":"Poppy.png","url":"https://en.wikipedia.org/wiki/Poppy"])
        redFlowers.append(["name":"Tulip","picture":"Tulip.png","url":"https://en.wikipedia.org/wiki/Tulip"])
        redFlowers.append(["name":"Gerbera","picture":"Gerbera.png","url":"https://en.wikipedia.org/wiki/Gerbera"])
        redFlowers.append(["name":"Peony","picture":"Peony.png","url":"https://en.wikipedia.org/wiki/Peony"])
        redFlowers.append(["name":"Rose","picture":"Rose.png","url":"https://en.wikipedia.org/wiki/Rose"])
        redFlowers.append(["name":"Hollyhock","picture":"Hollyhock.png","url":"https://en.wikipedia.org/wiki/Hollyhock"])
        redFlowers.append(["name":"Straw Flower","picture":"Strawflower.png","url":"https://en.wikipedia.org/wiki/Peony"])
        
        blueFlowers.append(["name":"Hyacinth","picture":"Hyacinth.png","url":"https://en.wikipedia.org/wiki/Hyacinth_(flower)"])
        blueFlowers.append(["name":"Hydrangea","picture":"Hydrangea.png","url":"https://en.wikipedia.org/wiki/Hydrangea"])
        blueFlowers.append(["name":"Sea Holly","picture":"Sea Holly.png","url":"https://en.wikipedia.org/wiki/Sea_holly"])
        blueFlowers.append(["name":"Grape Hyacinth","picture":"Grape Hyacinth.png","url":"https://en.wikipedia.org/wiki/Grape_hyacinth"])
        blueFlowers.append(["name":"Phlox","picture":"Phlox.png","url":"https://en.wikipedia.org/wiki/Phlox"])
        blueFlowers.append(["name":"Pin Cushion Flower","picture":"Pincushion flower.png","url":"https://en.wikipedia.org/wiki/Scabious"])
        blueFlowers.append(["name":"Iris","picture":"Iris.png","url":"https://en.wikipedia.org/wiki/Iris_(plant)"])
        
        flowerData=[redFlowers,blueFlowers]
    }


}

