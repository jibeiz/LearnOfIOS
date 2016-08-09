//
//  ViewController.h
//  ModalViewSample
//
//  Created by CodingDoge on 16/7/29.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>

- (IBAction)regonClick:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtUsername;
@property (weak, nonatomic) IBOutlet UITextField *txtCode;

@end

