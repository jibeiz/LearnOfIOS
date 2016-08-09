//
//  ViewController.h
//  plistDemo
//
//  Created by CodingDoge on 16/8/1.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate,UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *mainView;
@property (nonatomic, strong)NSDateFormatter *dateFormatter;
@property (nonatomic, strong)NSString *plistFilePath;
@property (nonatomic, strong)NSString *FilePathTest;
- (IBAction)viewButton:(id)sender;
- (IBAction)addButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *valueText;

@end

