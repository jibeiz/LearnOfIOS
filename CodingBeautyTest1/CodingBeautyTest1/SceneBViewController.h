//
//  SceneBViewController.h
//  CodingBeautyTest1
//
//  Created by yueng on 16/7/25.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SceneBViewControllerDelegate<NSObject>
- (void)sceneBViewController: (SceneBViewController *)sceneBVC didInputed: (NSString *)string;
@end

@interface SceneBViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) id <SceneBViewControllerDelegate> delegate;

@end


