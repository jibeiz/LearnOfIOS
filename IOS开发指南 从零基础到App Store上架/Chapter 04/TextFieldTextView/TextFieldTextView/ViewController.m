//
//  ViewController.m
//  TextFieldTextView
//
//  Created by CodingDoge on 16/8/7.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    CGFloat textFieldWidth = 223;
    CGFloat textFieldHeight = 30;
    CGFloat textFieldTopView = 150;
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake((screen.size.width-textFieldWidth)/2, textFieldTopView, textFieldWidth, textFieldHeight)];
    
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.delegate = self;
    textField.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:textField];
    
    // labeName标签与textField之间的距离
    CGFloat labelNameTextFieldSpace = 30;
    UILabel *labelName = [[UILabel alloc] initWithFrame:CGRectMake(textField.frame.origin.x, textField.frame.origin.y-labelNameTextFieldSpace, 51, 21)];
    
    labelName.text = @"Name:";
    labelName.backgroundColor = [UIColor blueColor];
    [self.view addSubview:labelName];
    
    CGFloat textViewWidth = 236;
    CGFloat textViewHeight = 198;
    CGFloat textViewTopView = 240;
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake((screen.size.width-textViewWidth)/2, textViewTopView, textViewWidth, textViewHeight)];
    
    textView.text = @"Lorem ipsum dolor sit er elit lamet, ...";
    textView.backgroundColor = [UIColor yellowColor];
    textView.returnKeyType = UIReturnKeyNext;
    textView.keyboardType = UIKeyboardTypeTwitter;
    textView.delegate = self;
    
    [self.view addSubview:textView];
    
    // labelName标签与textField之间的距离
    CGFloat labelAbstractTextViewSpace = 30;
    UILabel *labelAbstract = [[UILabel alloc] initWithFrame:CGRectMake(textView.frame.origin.x, textView.frame.origin.y-labelAbstractTextViewSpace, 103, 21)];
    labelAbstract.text = @"Abstract:";
    labelAbstract.backgroundColor = [UIColor grayColor];
    [self.view addSubview:labelAbstract];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return TRUE;
}

#pragma mark -- UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(nonnull NSString *)text
{
    if([text isEqualToString:@"\n"])
        [textView resignFirstResponder];
    return TRUE;
}

@end
