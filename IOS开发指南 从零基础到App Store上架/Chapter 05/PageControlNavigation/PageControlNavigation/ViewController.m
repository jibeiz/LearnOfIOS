//
//  ViewController.m
//  PageControlNavigation
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
    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width*3, self.scrollView.frame.size.height);
    self.scrollView.frame = self.view.frame;
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName: @"Main" bundle: nil];
    UIViewController* page1ViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"page1"];
    self.page1 = page1ViewController.view;
    self.page1.frame = CGRectMake(0.0f, 0.0f, 375.0f, 583.625f);
    
    UIViewController* page2ViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"page2"];
    self.page2 = page2ViewController.view;
    self.page2.frame = CGRectMake(375.0f, 0.0f, 375.0f, 583.6250f);
    
    UIViewController* page3ViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"page3"];
    self.page3 = page3ViewController.view;
    self.page3.frame = CGRectMake(2 * 375.0f, 0.0f, 375.0f, 583.625f);
    
    self.scrollView.delegate = self;
    
    [self.scrollView addSubview:self.page1];
    [self.scrollView addSubview:self.page2];
    [self.scrollView addSubview:self.page3];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;
    self.pageControl.currentPage = offset.x/375.0f;
}

- (IBAction)changePage:(id)sender
{
    [UIView animateWithDuration: 0.3f animations: ^{
        int whichPage = self.pageControl.currentPage;
        self.scrollView.contentOffset = CGPointMake(375.0f*whichPage, 0.0f);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
