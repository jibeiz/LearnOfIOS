//
//  ViewController.m
//  HelloWorld
//
//  Created by yueng on 16/5/25.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//  

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", @"viewDidLoad:");
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    // Dispose of any resources that can be recreated.
}

- (void)encodeRestorableStateWithCoder:(NSCoder *)coder
{
    [super encodeRestorableStateWithCoder: coder];
    [coder encodeObject: self.txtField.text forKey: kSaveKey];
}

- (void)decodeRestorableStateWithCoder:(NSCoder *)coder
{
    [super decodeRestorableStateWithCoder: coder];
    self.txtField.text = [coder decodeObjectForKey: kSaveKey];
}

@end
