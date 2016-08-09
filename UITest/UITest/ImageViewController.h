//
//  ImageViewController.h
//  UITest
//
//  Created by yueng on 16/7/22.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageViewController : UIViewController<UIScrollViewDelegate>

@property (nonatomic, strong) NSURL *imageURL;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end
