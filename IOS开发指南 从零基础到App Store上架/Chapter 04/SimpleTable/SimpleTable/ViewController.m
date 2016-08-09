//
//  ViewController.m
//  SimpleTable
//
//  Created by yueng on 16/6/14.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.searchBar setShowsScopeBar: NO];
    [self.searchBar sizeToFit];
    NSBundle *bundle = [NSBundle mainBundle];
    NSLog(@"mainBundle: %@", bundle);
    NSString *plistPath = [bundle pathForResource: @"team_dictionary" ofType: @"plist"];
    NSLog(@"plistPath: %@", plistPath);
    self.dictData = [[NSDictionary alloc] initWithContentsOfFile: plistPath];
    NSArray *teamList = [self.dictData allKeys];
    // 排序
    self.listGroupname = [teamList sortedArrayUsingSelector: @selector(compare:)];
    [self filterContentForSearchText: @"" scope: -1];
    
    NSLog(@"viewDidLoad.");
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self.searchBar setShowsScopeBar: YES];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - IndexTitles
- (NSArray *)sectionIndexTitlesForTableView: (UITableView *)tableView
{
    NSMutableArray *listTitles = [[NSMutableArray alloc] initWithCapacity: [self.listGroupname count]];
    for(NSString *item in self.listGroupname)
    {
        NSString *title = [item substringToIndex: 1];
        [listTitles addObject: title];
    }
    return listTitles;
}

#pragma mark - CententFilter
- (void)filterContentForSearchText:(NSString *)searchText scope:(NSUInteger)scope
{
    if([searchText length] == 0)
    {
        self.listFilterTeams = [NSMutableArray arrayWithArray: self.listTeams];
        return ;
    }
    
    NSPredicate *scopePredicate;
    NSString *tempArray;
    
    switch (scope) {
        case 0:
            scopePredicate = [NSPredicate predicateWithFormat: @"SELF.name contains[c] %@", searchText];
            tempArray = [self.listTeams filteredArrayUsingPredicate: scopePredicate];
            self.listFilterTeams = [NSMutableArray arrayWithArray: tempArray];
            break;
        case 1:
            scopePredicate = [NSPredicate predicateWithFormat: @"SELF.image contains[c] %@", searchText];
            tempArray = [self.listTeams filteredArrayUsingPredicate: tempArray];
            self.listFilterTeams = [NSMutableArray arrayWithArray: tempArray];
            
        default:
            self.listFilterTeams = [NSMutableArray arrayWithArray: self.listTeams];
            break;
    }
}

#pragma mark - UISearchDisplayDelegate
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText: searchString scope: self.searchBar.selectedScopeButtonIndex];
    return YES;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    [self filterContentForSearchText: self.searchBar.text scope: searchOption];
    return YES;
}

#pragma mark - UISearchBarDelegate
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self filterContentForSearchText: @"" scope: -1];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"tableView:numberOfRowsInSection.");
    // 按照节索引从小组名数组中获得组名
    NSString *groupName = [self.listGroupname objectAtIndex: section];
    // 将组名作为key，从字典中取出球队数组集合
    NSArray *listTeams = [self.dictData objectForKey: groupName];
    return [listTeams count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"tableView:cellForRowAtIndexPath.");
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier: CellIdentifier];
    }
    
    // 获取节和行
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    NSString *groupName = [self.listGroupname objectAtIndex: section];
    NSArray *listTeams = [self.dictData objectForKey: groupName];
    cell.textLabel.text = [listTeams objectAtIndex: row];
//    cell.detailTextLabel.text = [rowDict objectForKey: @"image"];
//    NSString *imagePath = [rowDict objectForKey: @"image"];
//    imagePath = [imagePath stringByAppendingString: @".png"];
//    cell.imageView.image = [UIImage imageNamed: imagePath];
    
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.listGroupname count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *groupName = [self.listGroupname objectAtIndex: section];
    return groupName;
}

@end
