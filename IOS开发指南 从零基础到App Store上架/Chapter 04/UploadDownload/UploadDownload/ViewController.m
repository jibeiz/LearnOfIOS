//
//  ViewController.m
//  UploadDownload
//
//  Created by CodingDoge on 16/8/9.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong)UIActivityIndicatorView *activityIndicatorView;
@property (nonatomic, strong)UIProgressView *progressView;
@property (nonatomic, strong)NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    // 1.获得指示器
    self.activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    CGRect fram = self.activityIndicatorView.frame;
    fram.origin = CGPointMake((screen.size.width-fram.size.width)/2, 84);
    self.activityIndicatorView.frame = fram;
    self.activityIndicatorView.backgroundColor = [UIColor blueColor];
    
    self.activityIndicatorView.hidesWhenStopped = FALSE;
    [self.view addSubview:self.activityIndicatorView];
    
    // 2.Upload按钮
    UIButton *buttonUpload = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonUpload setTitle:@"Upload" forState:UIControlStateNormal];
    CGFloat buttonUploadWidth = 50;
    CGFloat buttonUploadHeight = 30;
    CGFloat buttonUploadTopView = 190;
    
    buttonUpload.frame = CGRectMake((screen.size.width-buttonUploadWidth)/2, buttonUploadTopView, buttonUploadWidth, buttonUploadHeight);
    buttonUpload.layer.masksToBounds = YES;
    buttonUpload.layer.cornerRadius = 7;
    buttonUpload.layer.borderWidth = 3;
    buttonUpload.layer.borderColor = [UIColor grayColor].CGColor;
    buttonUpload.backgroundColor = [UIColor redColor];
    
    [buttonUpload addTarget:self action:@selector(startMove:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonUpload];
    
    // 3.进度条
    CGFloat progressViewWidth = 200;
    CGFloat progressViewHeight = 2;
    CGFloat progressViewTopView = 283;
    
    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake((screen.size.width-progressViewWidth)/2, progressViewTopView, progressViewWidth, progressViewHeight)];
    [self.view addSubview:self.progressView];
    
    // 4.Download按钮
    UIButton *buttonDownload = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonDownload setTitle:@"Download" forState:UIControlStateNormal];
    CGFloat buttonDownloadWidth = 69;
    CGFloat buttonDownloadHeight = 30;
    CGFloat buttonDownloadTopView = 384;
    
    buttonDownload.frame = CGRectMake((screen.size.width-buttonDownloadWidth)/2, buttonDownloadTopView, buttonDownloadWidth, buttonDownloadHeight);
    [buttonDownload addTarget:self action:@selector(downloadProgress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonDownload];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startMove:(id)sender
{
    if([self.activityIndicatorView isAnimating])
        [self.activityIndicatorView stopAnimating];
    else
        [self.activityIndicatorView startAnimating];
}

- (void)downloadProgress:(id)sender
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(download) userInfo:nil repeats:TRUE];
}
 - (void)download
{
    self.progressView.progress = self.progressView.progress+0.1;
    if(self.progressView.progress == 1.0)
    {
        [self.timer invalidate];
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"download completed!" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}
@end
