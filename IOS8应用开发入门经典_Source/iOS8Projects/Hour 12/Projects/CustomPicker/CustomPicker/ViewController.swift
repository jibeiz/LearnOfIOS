//
//  ViewController.swift
//  CustomPicker
//
//  Created by John Ray on 12/11/14.
//  Copyright (c) 2014 John E. Ray. All rights reserved.
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
    
    
    /*

    - (void)displayAnimal:(NSString *)chosenAnimal withSound:(NSString *)chosenSound fromComponent:(NSString *)chosenComponent {
    
    NSString *animalSoundString;
    animalSoundString=[[NSString alloc]
    initWithFormat:@"You changed %@ (%@ and the sound %@)",
    chosenComponent,chosenAnimal,chosenSound];
    self.outputLabel.text=animalSoundString;
    
    
    }


*/


}

