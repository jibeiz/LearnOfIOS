//
//  RadioTableTableViewController.h
//  UITableViewTest
//
//  Created by yueng on 16/7/26.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RadioTableTableViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *radioListArray;

@end
