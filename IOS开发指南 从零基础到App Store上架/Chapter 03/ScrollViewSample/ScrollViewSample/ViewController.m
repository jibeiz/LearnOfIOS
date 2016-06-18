//
//  ViewController.m
//  ScrollViewSample
//
//  Created by yueng on 16/5/31.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.contentSize = CGSizeMake(320, 600);
    self.textField.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.scrollView setContentOffset: CGPointMake(0, 110) animated: YES];
    [super viewDidAppear: YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(keyboardDidShow:) name: UIKeyboardDidShowNotification object: nil];
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(keyboardDidHide:) name: UIKeyboardDidHideNotification object: nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver: self name: UIKeyboardDidShowNotification object: nil];
    [[NSNotificationCenter defaultCenter] removeObserver: self name: UIKeyboardDidHideNotification object: nil];
}

- (void)keyboardDidShow: (NSNotification *)notif
{
    NSLog(@"This is keyboardDidShow.");
    NSLog(@"%d", keyboardVisible);
    if(keyboardVisible)
        return;
    // 获得键盘尺寸
    NSDictionary* info = [notif userInfo];
    NSValue* aValue = [info objectForKey: UIKeyboardFrameEndUserInfoKey];
    CGSize keyboardSize = [aValue CGRectValue].size;
    NSLog(@"The keyboard size height is %f width is %f", keyboardSize.height, keyboardSize.width);
    
    // 重新定义ScrollView的尺寸
    CGRect viewFrame = self.scrollView.frame;
    NSLog(@"The befor scrollview's height is %f", viewFrame.size.height);
    viewFrame.size.height -= (keyboardSize.height);
    NSLog(@"The after scrollview's height is %f", viewFrame.size.height);
    self.scrollView.frame = viewFrame;
    
    // 滚动到当前文本框
    CGRect textFieldRect = [self.textField frame];
    [self.scrollView scrollRectToVisible: textFieldRect animated: YES];
    
    keyboardVisible = YES;
    
}

- (void)keyboardDidHide: (NSNotification *)notif
{
    NSLog(@"This is keyboardDidHide.");
    NSLog(@"%d", keyboardVisible);
    NSDictionary* info = [notif userInfo];
    NSValue* aValue = [info objectForKey: UIKeyboardFrameEndUserInfoKey];
    CGSize keyboardSize = [aValue CGRectValue].size;
    NSLog(@"The keyboard size height is %f width is %f", keyboardSize.height, keyboardSize.width);
    
    CGRect viewFrame = self.scrollView.frame;
    NSLog(@"The befor scrollview's height is %f", viewFrame.size.height);
    viewFrame.size.height += keyboardSize.height;
    NSLog(@"The after scrollview's height is %f", viewFrame.size.height);
    self.scrollView.frame = viewFrame;
    
    if(!keyboardVisible)
        return;
    
    keyboardVisible = NO;
}

@end
