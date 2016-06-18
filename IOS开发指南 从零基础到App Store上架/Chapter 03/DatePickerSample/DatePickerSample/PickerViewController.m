//
//  PickerViewController.m
//  DatePickerSample
//
//  Created by yueng on 16/6/11.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import "PickerViewController.h"

@interface PickerViewController ()

@end

@implementation PickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource: @"provinces_ctites" ofType: @"plist"];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile: plistPath];
    self.pickerData = dict;
    
    self.pickerProvincesData = [self.pickerData allKeys];
    
    NSString *seletedProvince = [self.pickerProvincesData objectAtIndex: 0];
    self.pickerCitiesData = [self.pickerData objectForKey: seletedProvince];
    NSLog(@"second view is called.");
    
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onclick:(id)sender {
    NSInteger row1 = [self.pickerView selectedRowInComponent: 0];
    NSInteger row2 = [self.pickerView selectedRowInComponent: 1];
    NSString *selected1 = [self.pickerProvincesData objectAtIndex: row1];
    NSString *selected2 = [self.pickerCitiesData objectAtIndex: row2];
    
    NSString *title = [[NSString alloc] initWithFormat: @"%@, %@市", selected1, selected2];
    
    self.label.text = title;
    NSLog(@"second view click is called.");
}

#pragma mark - 实现协议UIPickerViewDataSource方法
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component == 0)
        return [self.pickerProvincesData count];
    else
        return [self.pickerCitiesData count];
}

#pragma mark - 实现协议UIPickerViewDelegate方法
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(component == 0)
        return [self.pickerProvincesData objectAtIndex: row];
    else
        return [self.pickerCitiesData objectAtIndex: row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(component == 0)
    {
        NSString *seletedProvince = [self.pickerProvincesData objectAtIndex: row];
        NSString *array = [self.pickerData objectForKey: seletedProvince];
        self.pickerCitiesData = array;
        [self.pickerView reloadComponent: 1];
    }
}
@end
