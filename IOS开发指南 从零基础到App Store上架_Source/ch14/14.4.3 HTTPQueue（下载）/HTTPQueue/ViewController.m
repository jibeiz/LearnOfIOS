//
//  ViewController.m
//  HTTPQueue
//
//  Created by 关东升 on 12-12-21.
//  本书网站：http://www.iosbook1.com
//  智捷iOS课堂：http://www.51work6.com
//  智捷iOS课堂在线课堂：http://v.51work6.com
//  智捷iOS课堂新浪微博：http://weibo.com/u/3215753973
//  作者微博：http://weibo.com/516inc
//  官方csdn博客：http://blog.csdn.net/tonny_guan
//  QQ：1575716557 邮箱：jylong06@163.com
//
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)onClick:(id)sender {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachesDirectory = paths[0];
	NSString *downloadPath = [cachesDirectory stringByAppendingPathComponent:@"test1.jpg"];
    
    
    NSString *path = [[NSString alloc] initWithFormat:@"/service/download.php?email=%@&FileName=test1.jpg",@"<你的iosbook1.com用户邮箱>"];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:@"iosbook1.com" customHeaderFields:nil];
    
    MKNetworkOperation *downloadOperation = [engine operationWithPath:path params:nil httpMethod:@"POST"];
    [downloadOperation addDownloadStream:[NSOutputStream outputStreamToFileAtPath:downloadPath
                                                                           append:YES]];
    
    [downloadOperation onDownloadProgressChanged:^(double progress) {
        NSLog(@"download progress: %.2f", progress*100.0);
        _progressView.progress = progress;
    }];
    
    [downloadOperation addCompletionHandler:^(MKNetworkOperation *operation) {
        
        NSLog(@"download file finished!");
        NSData *data = [operation responseData];
        
        if (data) {
            //返回数据失败
            NSError *eror;
            NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&eror];
            if (!resDict) {
                NSNumber *resultCodeObj = [resDict objectForKey:@"ResultCode"];
                
                NSString *errorStr = [resultCodeObj errorMessage];
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"错误信息"
                                                                    message:errorStr
                                                                   delegate:nil
                                                          cancelButtonTitle:@"OK"
                                                          otherButtonTitles: nil];
                [alertView show];
            }
        } else {
            //返回数据成功
            UIImage *img = [UIImage imageWithContentsOfFile:downloadPath];
            _imageView1.image = img;
        }
        
        
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* err) {
        NSLog(@"MKNetwork请求错误 : %@", [err localizedDescription]);
    }];
    
    [engine enqueueOperation:downloadOperation];
}

@end
