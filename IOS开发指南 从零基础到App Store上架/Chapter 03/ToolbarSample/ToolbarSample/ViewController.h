//
//  ViewController.h
//  ToolbarSample
//
//  Created by yueng on 16/6/5.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *textView;

- (IBAction)save:(id)sender;
- (IBAction)open:(id)sender;

@end

