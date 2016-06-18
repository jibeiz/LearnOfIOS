//
//  PITaxTests.m
//  PITaxTests
//
//  Created by tonyguan on 13-11-25.
//  Copyright (c) 2013年 tonyguan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AppDelegate.h"
#import "ViewController.h"


@interface PITaxTests : XCTestCase

@property (nonatomic, strong) ViewController *viewController;

@end

@implementation PITaxTests


- (void)setUp
{
    [super setUp];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    UIWindow *window = [appDelegate window];
    
    UINavigationController *navController = (UINavigationController*)window.rootViewController;
    self.viewController  = (ViewController*)navController.topViewController;
}

- (void)tearDown
{
    self.viewController = nil;
    
    [super tearDown];
}


//测试不输入直接点击计算按钮
- (void)testOnClickInputBlank
{
    XCTAssertNotNil(self.viewController, @"ViewController没有赋值。");
    //设定输入值
    self.viewController.txtRevenue.text = @"";
    //调用oncClick测试
    [self.viewController onClick:nil];
    //取得输出结果
    NSString* strTax = self.viewController.lblTax.text;
    //断言
    XCTAssertEqualObjects(strTax, @"0.00", @"期望值是：0.00 实际值是：%@", strTax);
    
}


//测试整数
- (void)testOnClickInputIntegerNumber
{
    XCTAssertNotNil(self.viewController, @"ViewController没有赋值。");
    //设定输入值
    self.viewController.txtRevenue.text = @"8000";
    //调用oncClick测试
    [self.viewController onClick:nil];
    //取得输出结果
    NSString* strTax = self.viewController.lblTax.text;
    //断言
    XCTAssertEqualObjects(strTax, @"345.00", @"期望值是：345.00 实际值是：%@", strTax);
    
}

//测试小数
- (void)testOnClickInputOneDot
{
    XCTAssertNotNil(self.viewController, @"ViewController没有赋值。");
    //设定输入值
    self.viewController.txtRevenue.text = @"8000.59";
    //调用oncClick测试
    [self.viewController onClick:nil];
    //取得输出结果
    NSString* strTax = self.viewController.lblTax.text;
    //断言
    XCTAssertEqualObjects(strTax, @"345.12", @"期望值是：345.12 实际值是：%@", strTax);
    
}


//测试输入两个小数点
- (void)testOnClickInputTwoDot
{
    XCTAssertNotNil(self.viewController, @"ViewController没有赋值。");
    //设定输入值
    self.viewController.txtRevenue.text = @"40000.50.56";
    //调用oncClick测试
    [self.viewController onClick:nil];
    //取得输出结果
    NSString* strTax = self.viewController.lblTax.text;
    //断言
    XCTAssertEqualObjects(strTax, @"8195.15", @"期望值是：8195.15 实际值是：%@", strTax);
}

//测试有前导0数据
- (void)testOnClickInputPrefixZero
{
    XCTAssertNotNil(self.viewController, @"ViewController没有赋值。");
    //设定输入值
    self.viewController.txtRevenue.text = @"08000.59";
    //调用oncClick测试
    [self.viewController onClick:nil];
    //取得输出结果
    NSString* strTax = self.viewController.lblTax.text;
    //断言
    XCTAssertEqualObjects(strTax, @"345.12", @"期望值是：345.12 实际值是：%@", strTax);
    
}

//测试连在一起两个小数点
- (void)testOnClickInputLinkDot
{
    XCTAssertNotNil(self.viewController, @"ViewController没有赋值。");
    //设定输入值
    self.viewController.txtRevenue.text = @"40000.50..56";
    //调用oncClick测试
    [self.viewController onClick:nil];
    //取得输出结果
    NSString* strTax = self.viewController.lblTax.text;
    //断言
    XCTAssertEqualObjects(strTax, @"8195.15", @"期望值是：8195.15 实际值是：%@", strTax);
    
}


@end
