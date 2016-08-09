//
//  ViewController.m
//  LabelButton
//
//  Created by CodingDoge on 16/8/7.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong)UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    CGFloat labelWidth = 90;
    CGFloat labelHeight = 20;
    CGFloat labelTopView = 150;
    
    self.label = [[UILabel alloc] initWithFrame: CGRectMake((screen.size.width-labelWidth)/2, labelTopView, labelWidth, labelHeight)];
    
    self.label.text = @"Label";
    // 字体左右居中
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.label];
    
    UIButton *button = [UIButton buttonWithType: UIButtonTypeSystem];
    [button setTitle:@"OK" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    
    CGFloat buttonWidth = 60;
    CGFloat buttonHeight = 20;
    CGFloat buttonTopView = 240;
    
    button.frame = CGRectMake((screen.size.width-buttonWidth)/2, buttonTopView, buttonWidth, buttonHeight);
    
    [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)onClick:(id)sender
{
    self.label.text = @"Hello World";
    self.label.backgroundColor = [UIColor blueColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
