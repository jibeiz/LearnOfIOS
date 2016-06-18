
//
//  NoteDAO.m
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

#import "NoteDAO.h"


@implementation NoteDAO

//插入Note方法
-(void) create:(Note*)model
{
    NSString *path = [HOST_PATH URLEncodedString];
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    
    [param setValue:@"test@51work6.com" forKey:@"email"];
    [param setValue:@"JSON" forKey:@"type"];
    [param setValue:@"add" forKey:@"action"];
    [param setValue:model.date forKey:@"date"];
    [param setValue:model.content forKey:@"content"];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:HOST_NAME customHeaderFields:nil];
    MKNetworkOperation *op = [engine operationWithPath:path params:param httpMethod:@"POST"];
    
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        
        NSData *data  = [operation responseData];
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSNumber *resultCodeNumber = [resDict objectForKey:@"ResultCode"];
        if ([resultCodeNumber integerValue] >=0)
        {
            [[NSNotificationCenter defaultCenter] postNotificationName:DaoCreateFinishedNotification object:nil];
            
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSNumber *resultCodeNumber = [NSNumber numberWithInt:resultCode];
            NSString* message = [resultCodeNumber errorMessage];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *error = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [[NSNotificationCenter defaultCenter] postNotificationName:DaoCreateFailedNotification object:error];
        }
        
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* err) {
        NSError *error = [errorOp error];
        [[NSNotificationCenter defaultCenter] postNotificationName:DaoCreateFailedNotification object:error];
    }];
    [engine enqueueOperation:op];
}

//删除Note方法
-(void) remove:(Note*)model
{
    
    NSString *path = [HOST_PATH URLEncodedString];
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    
    [param setValue:@"test@51work6.com" forKey:@"email"];
    [param setValue:@"JSON" forKey:@"type"];
    [param setValue:@"remove" forKey:@"action"];
    [param setValue:model.ID forKey:@"id"];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:HOST_NAME customHeaderFields:nil];
    MKNetworkOperation *op = [engine operationWithPath:path params:param httpMethod:@"POST"];
    
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        
        NSData *data  = [operation responseData];
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSNumber *resultCodeNumber = [resDict objectForKey:@"ResultCode"];
        if ([resultCodeNumber integerValue] >=0)
        {
            [[NSNotificationCenter defaultCenter] postNotificationName:DaoRemoveFinishedNotification object:nil];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSNumber *resultCodeNumber = [NSNumber numberWithInt:resultCode];
            NSString* message = [resultCodeNumber errorMessage];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *error = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [[NSNotificationCenter defaultCenter] postNotificationName:DaoRemoveFailedNotification object:error];
        }
        
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* err) {
        NSError *error = [errorOp error];
        [[NSNotificationCenter defaultCenter] postNotificationName:DaoRemoveFailedNotification object:error];
    }];
    [engine enqueueOperation:op];
}

//修改Note方法
-(void) modify:(Note*)model
{
    NSString *path = [HOST_PATH URLEncodedString];
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    
    [param setValue:@"test@51work6.com" forKey:@"email"];
    [param setValue:@"JSON" forKey:@"type"];
    [param setValue:@"modify" forKey:@"action"];
    [param setValue:model.ID forKey:@"id"];
    [param setValue:model.date forKey:@"date"];
    [param setValue:model.content forKey:@"content"];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:HOST_NAME customHeaderFields:nil];
    MKNetworkOperation *op = [engine operationWithPath:path params:param httpMethod:@"POST"];
    
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        
        NSData *data  = [operation responseData];
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSNumber *resultCodeNumber = [resDict objectForKey:@"ResultCode"];
        if ([resultCodeNumber integerValue] >=0)
        {
            [[NSNotificationCenter defaultCenter] postNotificationName:DaoModifyFinishedNotification object:nil];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSNumber *resultCodeNumber = [NSNumber numberWithInt:resultCode];
            NSString* message = [resultCodeNumber errorMessage];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *error = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [[NSNotificationCenter defaultCenter] postNotificationName:DaoModifyFailedNotification object:error];
        }
        
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* err) {
        NSError *error = [errorOp error];
        [[NSNotificationCenter defaultCenter] postNotificationName:DaoModifyFailedNotification object:error];
    }];
    [engine enqueueOperation:op];

}

//查询所有数据方法
-(void) findAll
{
    
    NSString *path = [HOST_PATH URLEncodedString];
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    
    [param setValue:@"test@51work6.com" forKey:@"email"];
    [param setValue:@"JSON" forKey:@"type"];
    [param setValue:@"query" forKey:@"action"];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:HOST_NAME customHeaderFields:nil];
    MKNetworkOperation *op = [engine operationWithPath:path params:param httpMethod:@"POST"];
    
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        
        NSData *data  = [operation responseData];
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSNumber *resultCodeNumber = [resDict objectForKey:@"ResultCode"];
        if ([resultCodeNumber integerValue] >=0)
        {
            NSMutableArray* listDict = [resDict objectForKey:@"Record"];
            
            NSMutableArray *listData = [NSMutableArray new];
            
            for (NSDictionary* dic in listDict) {
                Note *note = [Note new];
                note.ID = [dic objectForKey:@"ID"];
                note.date = [dic objectForKey:@"CDate"];
                note.content = [dic objectForKey:@"Content"];
                [listData addObject:note];
            }
            [[NSNotificationCenter defaultCenter] postNotificationName:DaoFindAllFinishedNotification object:listData];
            
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSNumber *resultCodeNumber = [NSNumber numberWithInt:resultCode];
            NSString* message = [resultCodeNumber errorMessage];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *error = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [[NSNotificationCenter defaultCenter] postNotificationName:DaoFindAllFailedNotification object:error];
        }
        
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* err) {
        NSError *error = [errorOp error];
        [[NSNotificationCenter defaultCenter] postNotificationName:DaoFindAllFailedNotification object:error];
    }];
    [engine enqueueOperation:op];
}


@end
