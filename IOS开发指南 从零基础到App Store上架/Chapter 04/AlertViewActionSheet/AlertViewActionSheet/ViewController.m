//
//  ViewController.m
//  AlertViewActionSheet
//
//  Created by CodingDoge on 16/8/8.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    // 警告框
    UIButton *buttonAlertView = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonAlertView setTitle:@"Test警告框" forState:UIControlStateNormal];
    
    CGFloat buttonAlertViewWidth = 100;
    CGFloat buttonAlertViewHeight = 30;
    CGFloat buttonAlertViewTopView = 130;
    
    buttonAlertView.frame = CGRectMake((screen.size.width-buttonAlertViewWidth)/2, buttonAlertViewTopView, buttonAlertViewWidth, buttonAlertViewHeight);
    [buttonAlertView addTarget:self action:@selector(testAlertView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonAlertView];
    
    
    // 操作表
    UIButton *buttonActionSheet = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonActionSheet setTitle:@"Test操作表" forState:UIControlStateNormal];
    
    CGFloat buttonActionSheetWidth = 100;
    CGFloat buttonActionSheetHeight = 30;
    CGFloat buttonActionSheetTopView = 260;
    
    buttonActionSheet.frame = CGRectMake((screen.size.width-buttonActionSheetWidth)/2, buttonActionSheetTopView, buttonActionSheetWidth, buttonActionSheetHeight);
    [buttonActionSheet addTarget:self action:@selector(testActionSheet:) forControlEvents:UIControlEventTouchUpInside];
    buttonActionSheet.layer.masksToBounds = YES;
    buttonActionSheet.layer.cornerRadius = 7;
    buttonActionSheet.layer.borderColor = [UIColor blueColor].CGColor;
    buttonActionSheet.layer.borderWidth = 2;
    [self.view addSubview:buttonActionSheet];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)testAlertView:(id)sender
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Alert text goes here" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
        NSLog(@"Tap No Button");
    }];
    
    UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        NSLog(@"Tap Yes Button");
    }];
    
    [alertController addAction:noAction];
    [alertController addAction:yesAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)testActionSheet:(id)sender
{
    UIAlertController *actionSheetController = [[UIAlertController alloc] init];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
        NSLog(@"Tap 取消 Button");
    }];
    
    UIAlertAction *destructiveAction = [UIAlertAction actionWithTitle:@"破坏性按钮" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action){
        NSLog(@"Tap 破坏性按钮 Button");
    }];
    
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"新浪微博" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        NSLog(@"Tap 新浪微博 Button");
    }];
    
    [actionSheetController addAction:cancelAction];
    [actionSheetController addAction:destructiveAction];
    [actionSheetController addAction:otherAction];
    
    [self presentViewController:actionSheetController animated:YES completion:nil];
}
@end
