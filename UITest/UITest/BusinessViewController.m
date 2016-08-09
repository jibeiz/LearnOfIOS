//
//  BusinessViewController.m
//  UITest
//
//  Created by yueng on 16/7/23.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import "BusinessViewController.h"

@interface BusinessViewController ()

@property(nonatomic, strong) UIImageView *imageView;
@property(nonatomic, strong) UIImage *image;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation BusinessViewController

#pragma mark - ScrollView
-(void) setScrollView:(UIScrollView *)scrollView
{
    _scrollView = scrollView;
    _scrollView.delegate = self;
    _scrollView.minimumZoomScale = 0.2;
    _scrollView.maximumZoomScale = 2;
    self.scrollView.contentSize = self.image.size;
    NSLog(@"BusinessViewController setScrollView.");
}

#pragma mark - ImageView
-(UIImageView *)imageView
{
    if(_imageView == nil)
        _imageView = [[UIImageView alloc] init];
    NSLog(@"BusinessViewController imageView.");
    return _imageView;
}

#pragma mark - ImageURL
-(void) setImageURL:(NSURL *)imageURL
{
    _imageURL = imageURL;
    self.image = [UIImage imageWithData: [NSData dataWithContentsOfURL: self.imageURL]]; // self.imageURL
    NSLog(@"BusinessViewController setImageURL.");
}

#pragma mark - Image
-(UIImage *)image
{
    NSLog(@"BusinessViewController image.");
    return self.imageView.image;
}

-(void)setImage:(UIImage *)image
{
    self.imageView.image = image;
    [self.imageView sizeToFit];
    NSLog(@"BusinessViewController setImage.");
}

#pragma mark - ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self addBgImageWithImageName: @"iphone6_3"];
    // Do any additional setup after loading the view.
    [self.scrollView addSubview: self.imageView];
    NSLog(@"BusinessViewController viewDidLoad.");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
