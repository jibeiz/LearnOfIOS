//
//  LonginViewController.m
//  UITest
//
//  Created by yueng on 16/7/25.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import "LonginViewController.h"

@interface LonginViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *loginScrollView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImage *image;

@end

@implementation LonginViewController

#pragma mark - ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self addBgImageWithImageName: @"iphone6_4"];
//    self.image = [UIImage imageNamed:@"image2"];
//    self.imageView.image = self.image;
    self.image = [UIImage imageNamed:@"image2"];
    NSLog(@"****1*****");
    [self.loginScrollView addSubview: self.imageView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Image
- (UIImage *)image
{
    NSLog(@"image");
    return self.imageView.image;
}

- (void) setImage:(UIImage *)image
{
    NSLog(@"setImage.");
    self.imageView.image = image;
//    self.imageView.image = [UIImage imageNamed:@"image2"];
    [self.imageView sizeToFit];
    NSLog(@"setImage end");
}

#pragma mark - ImageView
- (UIImageView *)imageView
{
    NSLog(@"imageView");
    if(_imageView == nil)
        _imageView = [[UIImageView alloc] init];
    return _imageView;
}

#pragma mark - ScrollView
- (void)setLoginScrollView:(UIScrollView *)loginScrollView
{
    NSLog(@"1");
    _loginScrollView = loginScrollView;
    NSLog(@"setLoginScrollView.");
}

#pragma mark - 给View添加背景图
- (void)addBgImageWithImageName:(NSString *)imageName
{
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:imageName]];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
