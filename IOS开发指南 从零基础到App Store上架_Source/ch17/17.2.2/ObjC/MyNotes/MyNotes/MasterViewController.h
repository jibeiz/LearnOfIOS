//
//  MasterViewController.h
//  MyNotes
//
//  Created by 关东升 on 15/12/31.
//  本书网站：http://www.51work6.com
//  智捷课堂在线课堂：http://www.zhijieketang.com/
//  智捷课堂微信公共号：zhijieketang
//  作者微博：@tony_关东升
//  作者微信：tony关东升
//  QQ：569418560 邮箱：eorient@sina.com
//  QQ交流群：162030268
//

#import <UIKit/UIKit.h>
#import "NSNumber+Message.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property(strong, nonatomic) DetailViewController *detailViewController;

//保存数据列表
@property(nonatomic, strong) NSMutableArray *listData;

//开始请求Web Service
- (void)startRequest;

@end