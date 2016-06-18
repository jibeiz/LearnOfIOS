//
//  AddViewController.h
//  MyNotes
//
//  Created by 关东升 on 12-9-26.
//  本书网站：http://www.iosbook1.com
//  智捷iOS课堂：http://www.51work6.com
//  智捷iOS课堂在线课堂：http://v.51work6.com
//  智捷iOS课堂新浪微博：http://weibo.com/u/3215753973
//  作者微博：http://weibo.com/516inc
//  官方csdn博客：http://blog.csdn.net/tonny_guan
//  QQ：1575716557 邮箱：jylong06@163.com
//

#import <UIKit/UIKit.h>

#import "NSString+URLEncoding.h"
#import "NSNumber+Message.h"

@interface AddViewController : UIViewController <UITextViewDelegate,NSURLConnectionDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;

- (IBAction)onclickDone:(id)sender;
- (IBAction)onclickSave:(id)sender;

//接收从服务器返回数据。
@property (strong,nonatomic) NSMutableData *datas;

//开始请求Web Service
-(void)startRequest;

@end
