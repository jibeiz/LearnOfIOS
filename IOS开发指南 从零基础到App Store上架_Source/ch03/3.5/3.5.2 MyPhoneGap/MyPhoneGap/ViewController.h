//
//  ViewController.h
//  MyPhoneGap
//
//  Created by tonyguan on 13-11-20.
//  Copyright (c) 2013年 tonyguan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSString+URLEncoding.h"

@interface ViewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end
