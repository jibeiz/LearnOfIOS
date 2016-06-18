//
//  BusinessLogicLayerTests.m
//  BusinessLogicLayerTests
//
//  Created by tonyguan on 13-11-26.
//  Copyright (c) 2013年 tonyguan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NoteDAO.h"
#import "Note.h"
#import "NoteBL.h"

@interface BusinessLogicLayerTests : XCTestCase

@property (nonatomic,strong) NSDateFormatter * dateFormatter;
@property (nonatomic,strong) NoteBL * bl;

@property (nonatomic,strong) NSString* theContent;
@property (nonatomic,strong) NSDate* theDate;

@end

@implementation BusinessLogicLayerTests

- (void)setUp
{
    [super setUp];
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    self.bl = [[NoteBL alloc] init];
    
    self.theContent = @"welcome www.51work6.com";
    self.theDate = [self.dateFormatter dateFromString:@"2000-06-03 08:20:38"];
}

- (void)tearDown
{
    self.dateFormatter = nil;
    self.bl = nil;
    [super tearDown];
}

//测试 插入Note方法
-(void) testCreateNote
{
    //创建Note对象
    Note *note = [[Note alloc] init];
    note.date  = self.theDate;
    note.content = self.theContent;
    
    NSArray* list = [self.bl createNote:note];
    //断言 查询记录数为1
    XCTAssertTrue([list count] == 1, @"查询记录数期望值为：1 实际值为：%i", [list count]);
}

//测试 查询所有数据方法
-(void) testFindAll
{
    NSArray* list =  [self.bl findAll];
    //断言 查询记录数为1
    XCTAssertTrue([list count] == 1, @"查询记录数期望值为：1 实际值为：%i", [list count]);
    
    Note* note  = list[0];
    //断言 cdate=2000-06-0308:20:38
    XCTAssertEqualObjects(self.theDate, note.date, @"日期字段期望值数为：%@ 实际值为：%@", self.theDate,note.date);
    //断言 content=welcome www.51work6.com
    XCTAssertEqualObjects(self.theContent, note.content, @"内容字段期望值数为：%@ 实际值为：%@", self.theContent,note.content);
}

//测试 删除数据方法
-(void) testRemove
{
    //创建Note对象
    Note *note = [[Note alloc] init];
    note.date  = self.theDate;
    
    NSArray* list = [self.bl remove:note];
    //断言 查询记录数为0
    XCTAssertTrue([list count] == 0, @"查询记录数期望值为：0 实际值为：%i", [list count]);
}

@end
