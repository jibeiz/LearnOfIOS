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
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"test1" ofType:@"jpg"];
    
    
    NSString *path = [[NSString alloc] initWithFormat:@"/service/upload.php"];
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setValue:@"<你的iosbook1.com用户邮箱>" forKey:@"email"];
    [param setValue:@"JSON" forKey:@"type"];
    [param setValue:@"query" forKey:@"action"];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:@"iosbook1.com" customHeaderFields:nil];
    MKNetworkOperation *op = [engine operationWithPath:path params:param httpMethod:@"POST"];
    
    
    [op addFile:filePath forKey:@"file" mimeType:@"jpg"];
    
    [op setFreezable:YES];
    
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        
        NSLog(@"download file finished!");
        NSData *data = [operation responseData];
        
        if (data) {
            
            NSError *eror;
            NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&eror];
            if (resDict) {
                NSNumber *resultCodeObj = [resDict objectForKey:@"ResultCode"];
                
                NSString *errorStr = [resultCodeObj errorMessage];
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"错误信息"
                                                                    message:errorStr
                                                                   delegate:nil
                                                          cancelButtonTitle:@"OK"
                                                          otherButtonTitles: nil];
                [alertView show];
                return ;
            }
        }
        [self seeImage];

        
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* err) {
        NSLog(@"MKNetwork请求错误 : %@", [err localizedDescription]);
    }];
    [engine enqueueOperation:op];
}

-(void)seeImage
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachesDirectory = paths[0];
	NSString *downloadPath = [cachesDirectory stringByAppendingPathComponent:@"1.jpg"];
    
    
    NSString *path = [[NSString alloc] initWithFormat:@"/service/download.php?email=%@&FileName=1.jpg",@"test@51work6.com"];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:@"iosbook1.com" customHeaderFields:nil];
    //[engine useCache];
    [engine emptyCache];
    
    MKNetworkOperation *downloadOperation = [engine operationWithPath:path params:nil httpMethod:@"POST" ssl:NO];
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
            UIImage *img = [UIImage imageWithContentsOfFile:downloadPath];
            _imageView1.image = img;
        }
        
        
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* err) {
        NSLog(@"MKNetwork请求错误 : %@", [err localizedDescription]);
    }];
    [engine enqueueOperation:downloadOperation];
}

@end
