//
//  ViewController.h
//  Switch_Slider_SegmentedControlSample
//
//  Created by yueng on 16/5/29.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISwitch *LeftSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *RightSwitch;
@property (weak, nonatomic) IBOutlet UITextView *Text;
@property (weak, nonatomic) IBOutlet UILabel *SliderValue;

- (IBAction)switchValueChanged1:(id)sender;
- (IBAction)switchValueChanged2:(id)sender;
- (IBAction)onClick:(id)sender;
- (IBAction)sliderValueChangde:(id)sender;
- (IBAction)touchDown:(id)sender;

@end

