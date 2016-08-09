//
//  SceneBViewController.m
//  CodingBeautyTest1
//
//  Created by yueng on 16/7/25.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import "SceneBViewController.h"
#import "ViewController.h"

@interface SceneBViewController ()

@end

@implementation SceneBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.textField resignFirstResponder];
    [self performSegueWithIdentifier: @"return" sender: nil];
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ViewController *vc = (ViewController *)segue.destinationViewController;
    if([segue.identifier isEqualToString: @"return"])
    {
        vc.textView.text = self.textField.text;
    }
    vc.title = @"Scene A";
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
