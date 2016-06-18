//
//  ViewController.m
//  DatePickerSample
//
//  Created by yueng on 16/6/10.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import "ViewController.h"
#import "PickerViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PickerViewController *pickerViewController = [[UIStoryboard storyboardWithName: @"PickerViewSample" bundle: NULL] instantiateViewControllerWithIdentifier: @"PickerViewController"];
    
    (self.secondView) = pickerViewController.view;
    self.oneView = self.view;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onclick:(id)sender {
    NSDate *theDate = self.datepicker.date;
    NSLog(@"the date pickerd is: %@", [theDate descriptionWithLocale: [NSLocale currentLocale]]);
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"YYYY-MM-dd HH:mm:ss"];
    NSLog(@"the date formate is: %@", [dateFormatter stringFromDate: theDate]);
    self.label.text = [dateFormatter stringFromDate: theDate];
}

- (IBAction)switchValueChange:(id)sender {
    UISwitch *witchSwitch = (UISwitch *)sender;
    BOOL setting = witchSwitch.isOn;
    if(setting == YES)
    {
        self.view = self.oneView;
    }
    else
    {
        self.view = self.secondView;
    }
}

@end
