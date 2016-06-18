//
//  PresentationLayerTests.m
//  PresentationLayerTests
//
//  Created by tonyguan on 13-11-26.
//  Copyright (c) 2013年 tonyguan. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Note.h"
#import "AppDelegate.h"


@interface PresentationLayerTests : XCTestCase

@property (nonatomic,strong) MasterViewController *masterViewController;

@end

@implementation PresentationLayerTests

- (void)setUp
{
    [super setUp];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    UIWindow *window = [appDelegate window];
    
    UINavigationController *navController = (UINavigationController*)window.rootViewController;
    self.masterViewController  = (MasterViewController*)navController.topViewController;
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testInitViewController
{
    //断言 MasterViewController非空
    XCTAssertNotNil(self.masterViewController, @"MasterViewController非空");
    //断言 MasterViewController中listData属性非空
    XCTAssertNotNil(self.masterViewController.listData, @"MasterViewController中listData属性非空");
    //断言 MasterViewController中bl属性非空
    XCTAssertNotNil(self.masterViewController.bl, @"MasterViewController中bl属性非空");
    NSLog(@"self.masterViewController.listData = %@",self.masterViewController.listData);
}

- (void)testMasterViewControllerReturnsCorrectNumberOfRows
{
    //断言 表视图返回行数为2
	XCTAssertEqual(2, [self.masterViewController tableView:nil numberOfRowsInSection:0], @"应该返回行数为2");
}

- (void)testMasterViewControllerReturnsTableViewCell
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
	
	UITableViewCell *cell = [self.masterViewController tableView:self.masterViewController.tableView cellForRowAtIndexPath:indexPath];
	//断言 单元格应该返回非空
	XCTAssertNotNil(cell, @"单元格应该返回非空");
    //断言 标签为非空
	XCTAssertEqualObjects(@"welcome www.51work6.com", cell.textLabel.text, @"标签为非空");
    
}

@end
