//
//  ViewController.m
//  i18n
//
//  Created by tonyguan on 13-11-23.
//  Copyright (c) 2013年 tonyguan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"App FinishLaunching %@" ,NSLocalizedString(@"Name", @"i18n App"));
    
    self.navItem.title = NSLocalizedString(@"Title", @"Title");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
