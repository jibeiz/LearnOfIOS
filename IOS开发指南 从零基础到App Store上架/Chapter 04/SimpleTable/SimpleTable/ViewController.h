//
//  ViewController.h
//  SimpleTable
//
//  Created by yueng on 16/6/14.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource, UISearchDisplayDelegate, UISearchBarDelegate>

@property (strong, nonatomic) NSArray *listTeams;
@property (nonatomic, strong) NSMutableArray *listFilterTeams;
@property (nonatomic, strong) NSDictionary *dictData;
@property (nonatomic, strong) NSArray *listGroupname;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

- (void) filterContentForSearchText: (NSString *)searchText scope:(NSUInteger)scope;

@end

