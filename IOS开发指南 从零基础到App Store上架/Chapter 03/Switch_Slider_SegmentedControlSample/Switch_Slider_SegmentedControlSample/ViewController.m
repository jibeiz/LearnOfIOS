//
//  ViewController.m
//  Switch_Slider_SegmentedControlSample
//
//  Created by yueng on 16/5/29.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchValueChanged1:(id)sender
{
    NSLog(@"changed1 is called.");
    UISwitch *witchSwitch = (UISwitch *)sender;
    BOOL setting = witchSwitch.isOn;
    //BOOL nosetting = !setting;
    [self.LeftSwitch setOn: setting animated: YES];
    [self.RightSwitch setOn: !setting animated: YES];
}

- (IBAction)switchValueChanged2:(id)sender {
    NSLog(@"changed2 is called.");
    UISwitch *witchSwitch = (UISwitch *)sender;
    BOOL setting = witchSwitch.isOn;
    //BOOL nosetting = !setting;
    [self.LeftSwitch setOn: !setting animated: YES];
    [self.RightSwitch setOn: setting animated: YES];
}

- (IBAction)onClick:(id)sender {
    [self.Text setText: nil];
    UISwitch *witchSwitch = (UISwitch *)sender;
    if(witchSwitch.isOn == true)
        self.Text.text = @"Hello Baby.";
    else
        [self.Text setText: nil];
}

- (IBAction)sliderValueChangde:(id)sender {
    UISlider *slider = (UISlider *)sender;
    int progressAsInt = (int)(slider.value + 0.5f);
    NSString *newText = [NSString stringWithFormat: @"%d", progressAsInt];
    self.SliderValue.text = newText;
}

- (IBAction)touchDown:(id)sender {
    if(self.RightSwitch.hidden == YES)
    {
        self.RightSwitch.hidden = NO;
        self.LeftSwitch.hidden = NO;
    }
    else
    {
        self.LeftSwitch.hidden = YES;
        self.RightSwitch.hidden = YES;
    }
}

@end
