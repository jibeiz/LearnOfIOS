//
//  ViewController.m
//  animationTest
//
//  Created by yueng on 16/7/27.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong)CALayer *myLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myLayer = [[CALayer alloc] init];
    self.myLayer.bounds = CGRectMake(100, 100, 50, 50);
    self.myLayer.backgroundColor = [UIColor redColor].CGColor;
    self.myLayer.position = CGPointMake(0, 0);         //    起始位置
    self.myLayer.anchorPoint = CGPointMake(0, 0);        //
    self.myLayer.cornerRadius = 20;                      //  四角圆滑程度
    
    [self.view.layer addSublayer:self.myLayer];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Animation
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CABasicAnimation *anima = [CABasicAnimation animation];
    anima.keyPath = @"position";
    
    anima.fromValue = [NSValue valueWithCGPoint: CGPointMake(0, 0)];
    anima.toValue = [NSValue valueWithCGPoint: CGPointMake(200, 300)];
    
    anima.removedOnCompletion = NO;
    
    anima.fillMode = kCAFillModeForwards;
    
    [self.myLayer addAnimation:anima forKey:nil];
}


@end
