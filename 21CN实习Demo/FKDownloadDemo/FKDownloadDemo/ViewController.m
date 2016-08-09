//
//  ViewController.m
//  FKDownloadDemo
//
//  Created by CodingDoge on 16/8/3.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import "ViewController.h"
static int flag;

@interface ViewController ()<NSURLSessionDownloadDelegate>
@property (nonatomic, strong)NSURLSession *session;
@property (nonatomic, strong)NSData *resumeData;
@property (nonatomic, strong)NSURL *url;
@property (nonatomic, strong)NSURLSessionDownloadTask *downloadTask;

@end

static NSString *task1_url = @"http://r.photo.store.qq.com/psb?/V12C65XH06dYvP/ilxwE.bPHsp7D2C88W0kzR1PMig*BzfginhwlbgN378!/r/dKFDH.YWAgAA";
static NSString *task2_url = @"http://picm.photophoto.cn/006/018/030/0180300367.jpg";

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    flag = 0;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Session
- (NSURLSession *)session
{
    if(_session == nil)
    {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration: configuration delegate:self delegateQueue: nil];
    }
    return _session;
}
#pragma mark - 保存路径
- (NSString *)resumeDataPath:(NSURL *)url
{
    NSString *fileName = [NSString stringWithFormat: @"%@~resume", url.absoluteString];
    NSString *resumePath = [NSTemporaryDirectory() stringByAppendingPathComponent: fileName];
    NSLog(@"保存续传数据路径: = %@", resumePath);
    return resumePath;
}

#pragma mark - load
- (NSData *)loadResumeData:(NSURL *)url
{
    NSString *filePath = [self resumeDataPath: url];
    return [NSData dataWithContentsOfFile: filePath];
}
#pragma mark - UI
- (IBAction)task1Start:(UIButton *)sender {
    sender.selected = !sender.selected;
    if(flag == 0)
    {
       NSURL *url = [NSURL URLWithString: task1_url];
        self.url = url;
        self.resumeData = [self loadResumeData: self.url];
        if(self.resumeData == nil)
        {
            self.downloadTask = [self.session downloadTaskWithURL: url];
            flag = 1;
        }
        //[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@""];
        [self.downloadTask resume];
    }
    
    if(!sender.selected)
    {
        [self.downloadTask cancelByProducingResumeData: ^(NSData * _Nullable resumeData){
            NSLog(@"暂停下载 = %zd", resumeData.length);
            self.resumeData = resumeData;
            self.downloadTask = nil;
            [resumeData writeToFile: [self resumeDataPath: self.url] atomically: YES];
        }];
    }
    else
    {
        if(self.resumeData == nil)
        {
            NSLog(@"没有续传数据...");
            return ;
        }
        self.downloadTask = [self.session downloadTaskWithResumeData: self.resumeData];
        [self.downloadTask resume];
    }
}

- (IBAction)task1Cancel:(UIButton *)sender {
    NSString *filePath = [self resumeDataPath: self.url];
    NSLog(@"filePath:%@", filePath);
    if([[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        NSLog(@"fileExists.");
        [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];

    }    
}
- (IBAction)task2Start:(UIButton *)sender {
    sender.selected = !sender.selected;
    NSURL *url = [NSURL URLWithString: task2_url];
    NSURLSessionConfiguration *defaultConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration: defaultConfig delegate: self delegateQueue: [NSOperationQueue mainQueue]];
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL: url];
    [downloadTask resume];
}

- (IBAction)task2Cancel:(UIButton *)sender {
}

#pragma mark - NSURLSessionDownloadDelegate
- (void)URLSession:(NSURLSession *)session downloadTask:(nonnull NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    float progress = totalBytesWritten*1.0/totalBytesExpectedToWrite;
    dispatch_async(dispatch_get_main_queue(), ^(){
        [self.task1Progress setProgress: progress animated: TRUE];
    });
    
    NSLog(@"进度 = %f", progress);
    NSLog(@"接收: %lld字节(已下载:%lld字节) 期待: %lld字节.", bytesWritten, totalBytesWritten, totalBytesExpectedToWrite);
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location
{
    NSLog(@"临时文件: %@\n", location);
    
    NSString *downloadsDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, TRUE) objectAtIndex: 0];
    
    NSString *downloadStrPath = [downloadsDir stringByAppendingPathComponent: @"/0180300367.jpg"];
    NSURL *downloadURLPath = [NSURL fileURLWithPath: downloadStrPath];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSError *error = nil;
    if([fileManager fileExistsAtPath: downloadStrPath])
    {
        [fileManager removeItemAtPath: downloadStrPath error: &error];
        if(error)
            NSLog(@"删除文件失败: %@", error.localizedDescription);
    }
    error = nil;
    if([fileManager moveItemAtURL:location toURL:downloadURLPath error:&error])
    {
        NSLog(@"文件保存: %@", downloadStrPath);
        UIImage *img = [UIImage imageWithContentsOfFile: downloadStrPath];
        self.imageView1.image = img;
    }
    else
    {
        NSLog(@"保存文件失败: %@", error.localizedDescription);
    }
}
@end


















