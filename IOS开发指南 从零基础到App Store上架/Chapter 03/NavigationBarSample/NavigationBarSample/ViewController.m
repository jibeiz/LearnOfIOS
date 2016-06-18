//
//  ViewController.m
//  NavigationBarSample
//
//  Created by yueng on 16/6/5.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender {
    self.label.text = @"点击save";
}

- (IBAction)add:(id)sender {
    self.label.text = @"点击add";
}
@end
