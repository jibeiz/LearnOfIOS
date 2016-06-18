//
//  LogicTests.m
//  LogicTests
//
//  Created by tonyguan on 13-11-25.
//  Copyright (c) 2013年 tonyguan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface LogicTests : XCTestCase
@property (nonatomic,strong) ViewController *viewController;
@end

@implementation LogicTests

- (void)setUp
{
    [super setUp];
    
    self.viewController = [[ViewController alloc] init];
    
}

- (void)tearDown
{
    self.viewController = nil;
    
    [super tearDown];
}

//测试月应纳税额不超过1500元 用例1
- (void)testCalculateLevel1
{
    
    double dbRevenue = 5000;
    NSString *strRevenue = [NSString stringWithFormat:@"%f",dbRevenue];
    NSString* strTax =[self.viewController calculate:strRevenue];
    
    XCTAssertTrue([strTax doubleValue] == 46, @"期望值是：45 实际值是：%@", strTax);
}

//测试月应纳税额超过1500元至4500元 用例2
- (void)testCalculateLevel2
{
    
    double dbRevenue = 8000;
    NSString *strRevenue = [NSString stringWithFormat:@"%f",dbRevenue];
    NSString* strTax =[self.viewController calculate:strRevenue];
    
    XCTAssertTrue([strTax doubleValue] == 345, @"期望值是：345 实际值是：%@", strTax);
}

//测试月应纳税额超过4500元至9000元 用例3
- (void)testCalculateLevel3
{
    
    double dbRevenue = 12500;
    NSString *strRevenue = [NSString stringWithFormat:@"%f",dbRevenue];
    NSString* strTax =[self.viewController calculate:strRevenue];
    
    XCTAssertTrue([strTax doubleValue] == 1245, @"期望值是：1245 实际值是：%@", strTax);
}


//测试月应纳税额超过9000元至35000元 用例4
- (void)testCalculateLevel4
{
    
    double dbRevenue = 38500;
    NSString *strRevenue = [NSString stringWithFormat:@"%f",dbRevenue];
    NSString* strTax =[self.viewController calculate:strRevenue];
    
    XCTAssertTrue([strTax doubleValue] == 7745, @"期望值是：7745 实际值是：%@", strTax);
}

//测试月应纳税额超过35000元至55000元 用例5
- (void)testCalculateLevel5
{
    
    double dbRevenue = 58500;
    NSString *strRevenue = [NSString stringWithFormat:@"%f",dbRevenue];
    NSString* strTax =[self.viewController calculate:strRevenue];
    
    XCTAssertTrue([strTax doubleValue] == 13745, @"期望值是：13745 实际值是：%@", strTax);
}


//测试月应纳税额超过55000元至80000元 用例6
- (void)testCalculateLevel6
{
    
    double dbRevenue = 83500;
    NSString *strRevenue = [NSString stringWithFormat:@"%f",dbRevenue];
    NSString* strTax =[self.viewController calculate:strRevenue];
    
    XCTAssertTrue([strTax doubleValue] == 22495, @"期望值是：22495 实际值是：%@", strTax);
}

//测试月应纳税额超过80000元 用例7
- (void)testCalculateLevel7
{
    
    double dbRevenue = 103500;
    NSString *strRevenue = [NSString stringWithFormat:@"%f",dbRevenue];
    NSString* strTax =[self.viewController calculate:strRevenue];
    
    XCTAssertTrue([strTax doubleValue] == 31495, @"期望值是：31495 实际值是：%@", strTax);
}

@end
