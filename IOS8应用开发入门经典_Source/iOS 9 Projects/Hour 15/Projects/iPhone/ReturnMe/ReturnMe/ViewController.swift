//
//  ViewController.swift
//  ReturnMe
//
//  Created by John Ray on 10/18/15.
//  Copyright © 2015 John E. Ray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let kName:String = "name"
    let kEmail:String = "email"
    let kPhone:String = "phone"
    let kPicture:String = "picture"
    
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phone: UILabel!
    
    
    func setValuesFromPreferences() {
        let userDefaults:NSUserDefaults=NSUserDefaults.standardUserDefaults()
        
        let initialDefaults:[String:String]=[kPicture:"Dog",
            kName:"Your Name",
            kEmail:"you@yours.com",
            kPhone:"(555)555-1212"]
        
        userDefaults.registerDefaults(initialDefaults)
        
        let picturePreference:String=userDefaults.stringForKey(kPicture)!
        
        if picturePreference=="Dog" {
            picture.image=UIImage(named: "dog1.png")
        } else if picturePreference=="Crazy Dog" {
            picture.image=UIImage(named: "dog2.png")
        } else {
            picture.image=UIImage(named: "coral.png")
        }
        
        name.text = userDefaults.stringForKey(kName)
        email.text = userDefaults.stringForKey(kEmail)
        phone.text = userDefaults.stringForKey(kPhone)
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setValuesFromPreferences()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

