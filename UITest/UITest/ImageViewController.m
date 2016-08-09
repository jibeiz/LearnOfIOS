//
//  ImageViewController.m
//  UITest
//
//  Created by yueng on 16/7/22.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()

@property(nonatomic, strong) UIImageView *imageView;
@property(nonatomic, strong) UIImage *image;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ImageViewController

#pragma mark - ImageURL
-(void) setImageURL:(NSURL *)imageURL
{
    _imageURL = imageURL;
    [self startDownloadingImage];
    // self.image = [UIImage imageWithData: [NSData dataWithContentsOfURL: self.imageURL]];
    NSLog(@"setImageURL.");
    
}

#pragma mark - Image
-(void) setImage: (UIImage *)image
{
    self.imageView.image = image;
    [self.imageView sizeToFit];
    [self.spinner stopAnimating];
    NSLog(@"setImage.");
}

-(UIImage *)image
{
    NSLog(@"image.");
    return self.imageView.image;
}

#pragma mark - ImageView
- (UIImageView *)imageView
{
    if(_imageView == nil)
        //_imageView = [[UIImageView alloc] initWithFrame: CGRectMake(0, 0, 375, 667)];
        _imageView = [[UIImageView alloc] init];
    NSLog(@"imageView.");
    return _imageView;
}

#pragma mark - ScrollView
-(void) setScrollView:(UIScrollView *)scrollView
{
    _scrollView = scrollView;
    _scrollView.delegate = self;
    _scrollView.minimumZoomScale = 0.2;
    _scrollView.maximumZoomScale = 2;
    self.scrollView.contentSize = self.image.size;
    //CGSizeMake(375, 667);
    //    NSLog(@"image.size = %@", NSStringFromCGSize(self.image.size));
//    NSLog(@"scrollView.contentSize = %@", NSStringFromCGSize(self.scrollView.contentSize));
    NSLog(@"setScrollView.");
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    NSLog(@"viewForZoomingInScrollView.");
    return self.imageView;
}

#pragma mark - Download
-(void) startDownloadingImage
{
    self.image = nil;
    NSLog(@"startDownloadingImage is called.");
    if(self.imageURL)
    {
        [self.spinner startAnimating];
        NSURLRequest *request = [NSURLRequest requestWithURL: self.imageURL];
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration: configuration];
        NSURLSessionDownloadTask *task = [session downloadTaskWithRequest: request completionHandler: ^(NSURL *localfile, NSURLResponse *response, NSError *error){
            if(!error)
            {
                NSLog(@"if !error");
                if([request.URL isEqual: self.imageURL])
                {
                    NSLog(@"if after.");
                    UIImage *image = [UIImage imageWithData: [NSData dataWithContentsOfURL: localfile]];
                    dispatch_async(dispatch_get_main_queue(), ^{self.image = image;});
                }
            }
        }];
        [task resume];
        NSLog(@"startDownloadingImage is end.");
    }
}

#pragma mark - ViewController
- (void)viewDidLoad {
    NSLog(@"ImageViewController viewDidLoad is called.");
    [super viewDidLoad];
//    [self addBgImageWithImageName: @"iphone6_2"];
    
    //self.textView.text = @"It's OK.";
    
//    NSLog(@"%@", self.imageURL);

    [self.scrollView addSubview: self.imageView];
    // Do any additional setup after loading the view.
    NSLog(@"ImageViewController viewDidLoad is end");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
//    NSLog(@"ImageViewController didReceiveMemoryWarning.");
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
