//
//  PersistenceLayerTests.m
//  PersistenceLayerTests
//
//  Created by tonyguan on 13-11-26.
//  Copyright (c) 2013年 tonyguan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NoteDAO.h"
#import "Note.h"

@interface PersistenceLayerTests : XCTestCase

@property (nonatomic,strong) NSDateFormatter * dateFormatter;
@property (nonatomic,strong) NoteDAO * dao;

@property (nonatomic,strong) NSString* theContent;
@property (nonatomic,strong) NSDate* theDate;

@end

@implementation PersistenceLayerTests

- (void)setUp
{
    [super setUp];
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    self.dao = [NoteDAO sharedManager];
    self.theContent = @"welcome www.51work6.com";
    self.theDate = [self.dateFormatter dateFromString:@"2000-06-03 08:20:38"];

}

- (void)tearDown
{
    self.dateFormatter = nil;
    self.dao = nil;
    [super tearDown];
}

//测试 插入Note方法
-(void) testCreate
{
    //创建Note对象
    Note *note = [[Note alloc] init];
    note.date  = self.theDate;
    note.content = self.theContent;
    
    int res = [self.dao create:note];
    //断言 无异常，返回值为0，
    XCTAssertNotEqual(res == 0, @"数据插入失败");
    
}

//测试 查询所有数据方法
-(void) testFindAll
{
    NSArray* list =  [self.dao findAll];
    //断言 查询记录数为1
    XCTAssertTrue([list count] == 1, @"查询记录数期望值为：1 实际值为：%i", [list count]);
    
    Note* note  = list[0];
    //断言 cdate=2000-06-0308:20:38
    XCTAssertEqualObjects(self.theDate, note.date, @"日期字段期望值数为：%@ 实际值为：%@", self.theDate,note.date);
    //断言 content= welcome www.51work6.com
    XCTAssertEqualObjects(self.theContent, note.content, @"内容字段期望值数为：%@ 实际值为：%@", self.theContent,note.content);
}

//测试 按照主键查询数据方法
-(void) testFindById
{
    //创建Note对象
    Note *note = [[Note alloc] init];
    note.date  = self.theDate;
    
    Note* resNote = [self.dao findById:note];
    //断言 查询结果非nil
    XCTAssertNotNil(resNote, @"查询记录为nil");
    //断言 cdate=2000-06-0308:20:38
    XCTAssertEqualObjects(note.date , resNote.date, @"日期字段期望值数为：%@ 实际值为：%@",  note.date ,resNote.date);
    //断言 content= welcome www.51work6.com
    XCTAssertEqualObjects(self.theContent, resNote.content, @"内容字段期望值数为：%@ 实际值为：%@", self.theContent,resNote.content);
}

//测试 修改Note方法
-(void) testModify
{
    //创建Note对象
    Note *note = [[Note alloc] init];
    note.date  = self.theDate;
    note.content = @"www.51work6.com";
    
    int res = [self.dao modify:note];
    //断言 无异常，返回值为0
    XCTAssertNotEqual(res == 0, @"数据修改失败");
    
    Note* resNote = [self.dao findById:note];
    //断言 查询结果非nil
    XCTAssertNotNil(resNote, @"查询记录为nil");
    //断言 cdate=2000-06-0308:20:38
    XCTAssertEqualObjects(note.date , resNote.date, @"日期字段期望值数为：%@ 实际值为：%@",  note.date ,resNote.date);
    //断言 content=www.51work6.com
    XCTAssertEqualObjects(note.content, resNote.content, @"内容字段期望值数为：%@ 实际值为：%@", note.content,resNote.content);
}


//测试 删除数据方法
-(void) testRemove
{
    //创建Note对象
    Note *note = [[Note alloc] init];
    note.date  = self.theDate;
    
    int res =   [self.dao remove:note];
    //断言 无异常，返回值为0
    XCTAssertNotEqual(res == 0, @"数据修改失败");
    
    Note* resNote = [self.dao findById:note];
    //断言 查询结果nil
    XCTAssertNil(resNote, @"记录删除失败");
    
}

@end
