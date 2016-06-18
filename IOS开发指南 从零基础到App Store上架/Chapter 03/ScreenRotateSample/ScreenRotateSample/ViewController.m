//
//  ViewController.m
//  ScreenRotateSample
//
//  Created by yueng on 16/6/10.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import "ViewController.h"
#import "LandscapeViewController.h"

#define deg2rad (M_PI/180.0)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LandscapeViewController *landscapeViewController = [[UIStoryboard storyboardWithName: @"LandscapeStoryboard" bundle: NULL] instantiateViewControllerWithIdentifier: @"LandscapeViewController"];
    
    (self.mainLandscapeView) = landscapeViewController.view;
    self.mainPortraitView = self.view;
    // Do any additional setup after loading the view, typically from a nib.
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if(toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
    {
        NSLog(@"LandscapeRight.");
        self.view = self.mainLandscapeView;
        self.view.transform = CGAffineTransformMakeRotation(deg2rad*(90));
        self.view.bounds = CGRectMake(0.0, 0.0, 1334, 750);
    }
    else if(toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft)
    {
        NSLog(@"LandscapeLeft.");
        self.view = self.mainLandscapeView;
        self.view.transform = CGAffineTransformMakeRotation(deg2rad*(-90));
        self.view.bounds = CGRectMake(0.0, 0.0, 1334, 750);
    }
    else
    {
        NSLog(@"Portrait.");
        self.view = self.mainPortraitView;
        self.view.transform = CGAffineTransformMakeRotation(deg2rad*(0));
        self.view.bounds = CGRectMake(0.0, 0.0, 750, 1334);
    }
    [super willRotateToInterfaceOrientation: toInterfaceOrientation duration:duration];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
