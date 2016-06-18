//
//  NoteDAO.h
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
#import "Note.h"
#import "NSString+URLEncoding.h"
#import "NSNumber+Message.h"
#import "MKNetworkKit.h"

#define HOST_PATH @"/service/mynotes/webservice.php"
#define HOST_NAME @"iosbook1.com"


@interface NoteDAO : NSObject

//保存数据列表
@property (nonatomic,strong) NSMutableArray* listData;


//插入Note方法
-(void) create:(Note*)model;

//删除Note方法
-(void) remove:(Note*)model;

//修改Note方法
-(void) modify:(Note*)model;

//查询所有数据方法
-(void) findAll;

@end
