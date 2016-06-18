//
//  ViewController.h
//  ActivityIndicatorViewProgressViewSample
//
//  Created by yueng on 16/6/1.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSTimer *myTimer;
}

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *myActivityIndicatorView;
@property (weak, nonatomic) IBOutlet UIProgressView *myProgressView;
- (IBAction)startToMove:(id)sender;
- (IBAction)downloadProgress:(id)sender;

@end

