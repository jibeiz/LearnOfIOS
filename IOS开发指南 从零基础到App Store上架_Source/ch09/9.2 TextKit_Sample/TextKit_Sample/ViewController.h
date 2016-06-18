//
//  ViewController.h
//  TextKit_Sample
//
//  Created by tonyguan on 13-11-30.
//  Copyright (c) 2013年 tonyguan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic,strong) NSTextContainer* textContainer;

@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (void) markWord:(NSString*)word inTextStorage:(NSTextStorage*)textStorage;

@end
