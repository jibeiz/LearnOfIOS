//
//  ViewController.m
//  ModalViewSample
//
//  Created by CodingDoge on 16/7/29.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(registerCompletion:) name: @"RegisterCompletionNotification" object: nil] ;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)registerCompletion:(NSNotification *)notification
{
    NSDictionary *theData = [notification userInfo];
    NSString *username = [theData objectForKey: @"username"];
    NSLog(@"username = &@", username);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [self.txtUsername resignFirstResponder];
    [self.txtCode resignFirstResponder];
    return YES;
}

- (IBAction)regonClick:(id)sender {
//    NSLog(@"****1****");
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName: @"Main" bundle: nil];
//    UIStoryboard *mainStoryboard = [[UIStoryboard alloc] init];
//    NSLog(@"****2****");
    UIViewController *registerViewController = [mainStoryboard instantiateViewControllerWithIdentifier: @"registerViewController"];
//    NSLog(@"****3****");
    registerViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController: registerViewController animated: YES completion: ^{
        NSLog(@"Present Modal View");
    }];
}
@end
