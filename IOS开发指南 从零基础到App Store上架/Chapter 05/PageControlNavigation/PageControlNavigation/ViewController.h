//
//  ViewController.h
//  PageControlNavigation
//
//  Created by CodingDoge on 16/7/29.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) UIView *page1;
@property (strong, nonatomic) UIView *page2;
@property (strong, nonatomic) UIView *page3;
- (IBAction) changePage:(id)sender;

@end

