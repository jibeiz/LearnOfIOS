//
//  ViewController.m
//  MyPhoneGap
//
//  Created by tonyguan on 13-11-20.
//  Copyright (c) 2013年 tonyguan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.webView.delegate = self;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"www/index" ofType:@"html"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath: path]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UIWebViewDelegate

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.webView stringByEvaluatingJavaScriptFromString:@"helloWorld('从iOS对象中调用JS Ok.')"];
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *actionType = request.URL.host;
    NSString *scheme = request.URL.scheme;
    NSString *fragment = [request.URL.fragment URLDecodedString];
    NSData *responseData = [fragment dataUsingEncoding:NSUTF8StringEncoding];
    
    if ( [scheme isEqualToString:@"gap"] ) {
        if ([actionType isEqualToString:@"XXXClass.XXXmethod"]) {
            
            NSError* error;
            NSDictionary* json = [NSJSONSerialization
                                  JSONObjectWithData:responseData
                                  options:NSJSONReadingAllowFragments
                                  error:&error];
            
            NSLog(@"title: %@ , message: %@",[json objectForKey:@"title"], [json objectForKey:@"message"] );
            
        }
    }
    return true;
}


@end
