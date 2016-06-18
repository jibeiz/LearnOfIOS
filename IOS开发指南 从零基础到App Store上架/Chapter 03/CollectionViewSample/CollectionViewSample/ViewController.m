//
//  ViewController.m
//  CollectionViewSample
//
//  Created by yueng on 16/6/13.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import "ViewController.h"
#import "Cell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistpath = [bundle pathForResource: @"events" ofType: @"plist"];
    
    NSArray *array = [[NSArray alloc] initWithContentsOfFile: plistpath];
    self.events = array;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.events count]/2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"Cell" forIndexPath: indexPath];
    NSDictionary *event = [self.events objectAtIndex: (indexPath.section*2 + indexPath.row)];
    cell.label.text = [event objectForKey: @"name"];
    cell.imageView.image = [UIImage imageNamed: [event objectForKey: @"image"]];
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *event = [self.events objectAtIndex: (indexPath.section*2 + indexPath.row)];
}

@end
