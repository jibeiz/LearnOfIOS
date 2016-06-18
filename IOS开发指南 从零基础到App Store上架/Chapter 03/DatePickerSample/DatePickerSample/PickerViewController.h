//
//  PickerViewController.h
//  DatePickerSample
//
//  Created by yueng on 16/6/11.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickerViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (nonatomic, strong) NSDictionary *pickerData;
@property (nonatomic, strong) NSArray *pickerProvincesData;
@property (nonatomic, strong) NSArray *pickerCitiesData;

- (IBAction)onclick:(id)sender;

@end
