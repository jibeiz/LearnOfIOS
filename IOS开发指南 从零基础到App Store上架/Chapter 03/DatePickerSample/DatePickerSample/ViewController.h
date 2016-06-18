//
//  ViewController.h
//  DatePickerSample
//
//  Created by yueng on 16/6/10.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) UIView *oneView;
@property (nonatomic, strong) UIView *secondView;

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIDatePicker *datepicker;

- (IBAction)onclick:(id)sender;
- (IBAction)switchValueChange:(id)sender;



@end

