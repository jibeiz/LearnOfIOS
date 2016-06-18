//
//  ViewController.m
//  TextField_TextViewSample
//
//  Created by yueng on 16/5/28.
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

// 通过委托来放弃“第一响应者”
#pragma mark - UITextField Delegate Method
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

// 通过委托来放弃“第一响应者”
#pragma mark - UITextView Delegate Method
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text isEqualToString: @"\n"])
    {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    // 注册键盘出现通知
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(keyboardDidShow:) name: UIKeyboardDidShowNotification object: nil];
    
    // 注册键盘隐藏通知
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(keyboardDidHide:) name: UIKeyboardDidHideNotification object: nil];
    [super viewWillAppear: animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    // 解除键盘出现通知
    [[NSNotificationCenter defaultCenter] removeObserver: self name: UIKeyboardDidShowNotification object: nil];
    
    // 解除键盘隐藏通知
    [[NSNotificationCenter defaultCenter] removeObserver: self name: UIKeyboardDidHideNotification object: nil];
    [super viewWillDisappear: animated];
}

- (void)keyboardDidShow: (NSNotification *)notif
{
    NSLog(@"键盘打开");
}

- (void)keyboardDidHide: (NSNotification *)notif
{
    NSLog(@"键盘关闭");
}

@end
