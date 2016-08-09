//
//  ViewController.m
//  FKNSURLSessionDemo
//
//  Created by CodingDoge on 16/8/3.
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

#pragma mark - 开始请求Web Service
- (void)startRequest
{
    NSString *strURL = [[NSString alloc] initWithFormat: @"http://www.51work6.com/service/mynotes/WebService.php?email=%@&type=%@&action=%@", @"yfk12335727@vip.qq.com", @"JSON", @"query"];
    strURL = [strURL stringByAddingPercentEncodingWithAllowedCharacters: [NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *url = [NSURL URLWithString: strURL];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL: url];
    NSURLSession *session = [[NSURLSession alloc] init];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest: request completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error){
        NSLog(@"请求完成...");
        if(!error)
        {
            NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingAllowFragments error: nil];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self reloadView:resDict];
            });
        }
        else
        {
            NSLog(@"error: %@", error.localizedDescription);
        }
    }];
    [dataTask resume];
}

#pragma mark - 重新加载视图表
- (void)reloadView:(NSDictionary *)res
{
    NSNumber *resultCode = res[@"ResultCode"];
    
    if([resultCode integerValue] >= 0)
    {
        
    }
}

@end
