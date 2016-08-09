//
//  ViewController.h
//  UITest
//
//  Created by yueng on 16/7/21.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextField *accountText;
@property (weak, nonatomic) IBOutlet UITextField *secretText;
- (IBAction)unwindSceneAViewController: (UIStoryboard *)segue;
- (IBAction)longinClick:(UIButton *)sender;

@end

