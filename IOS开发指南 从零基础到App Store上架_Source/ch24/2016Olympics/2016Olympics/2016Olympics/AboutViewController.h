//
//  AboutViewController.h
//  2016Olympics
//
//  Created by 关东升 on 12-11-24.
//  本书网站：http://www.iosbook1.com
//  智捷iOS课堂：http://www.51work6.com
//  智捷iOS课堂在线课堂：http://v.51work6.com
//  智捷iOS课堂新浪微博：http://weibo.com/u/3215753973
//  作者微博：http://weibo.com/516inc
//  官方csdn博客：http://blog.csdn.net/tonny_guan
//  QQ：1575716557 邮箱：jylong06@163.com
//

#import <UIKit/UIKit.h>
#import "GADBannerView.h"

#define kSampleAdUnitID @"a14df1974738141"

@interface AboutViewController : UIViewController <GADBannerViewDelegate>

@property (strong, nonatomic) GADBannerView *bannerView;


- (GADRequest *)createRequest;

@end
