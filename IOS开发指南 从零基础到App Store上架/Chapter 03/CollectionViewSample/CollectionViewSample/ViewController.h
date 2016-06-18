//
//  ViewController.h
//  CollectionViewSample
//
//  Created by yueng on 16/6/13.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UICollectionViewController<UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) NSArray *events;

@end

