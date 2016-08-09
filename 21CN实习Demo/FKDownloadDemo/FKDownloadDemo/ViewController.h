//
//  ViewController.h
//  FKDownloadDemo
//
//  Created by CodingDoge on 16/8/3.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIProgressView *task1Progress;
- (IBAction)task1Start:(UIButton *)sender;
- (IBAction)task1Cancel:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UIProgressView *task2Progress;
- (IBAction)task2Start:(UIButton *)sender;
- (IBAction)task2Cancel:(UIButton *)sender;

@end

