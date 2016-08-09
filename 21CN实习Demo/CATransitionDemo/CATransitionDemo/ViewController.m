//
//  ViewController.m
//  CATransitionDemo
//
//  Created by yueng on 16/7/27.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import "ViewController.h"
#define DURATION 1.0f
#define IMAGE1 @"01.jpg"
#define IMAGE2 @"02.jpg"

@interface ViewController ()

typedef enum : NSUInteger {
    Fade = 1,                   //淡入淡出
    Push,                       //推挤
    Reveal,                     //揭开
    MoveIn,                     //覆盖
    Cube,                       //立方体
    SuckEffect,                 //吮吸
    OglFlip,                    //翻转
    RippleEffect,               //波纹
    PageCurl,                   //翻页
    PageUnCurl,                 //反翻页
    CameraIrisHollowOpen,       //开镜头
    CameraIrisHollowClose,      //关镜头
    CurlDown,                   //下翻页
    CurlUp,                     //上翻页
    FlipFromLeft,               //左翻转
    FlipFromRight               //右翻转
    
} AnimationType;
@property (nonatomic, assign) int subtype;

@end

@implementation ViewController

- (void)viewDidLoad {
    _subtype = 0;
    [super viewDidLoad];
    
    [self addBgImageWithImageName:IMAGE2];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClick: (id)sender
{
    UIButton *button = sender;
    AnimationType animationType = button.tag;
    
    NSString *subtypeString;
    switch (_subtype) {
        case 0:
            subtypeString = kCATransitionFromLeft;
            break;
        case 1:
            subtypeString = kCATransitionFromBottom;
            break;
        case 2:
            subtypeString = kCATransitionFromRight;
            break;
        case 3:
            subtypeString = kCATransitionFromTop;
            break;
            
        default:
            break;
    }
    _subtype += 1;
    if(_subtype > 3)
        _subtype = 0;
    
//    NSLog(@"hello1.");
    switch (animationType) {
        case Fade:
        {
            [self transitionWithType:kCATransitionFade WithSubtype:subtypeString ForView:self.view];
//            NSLog(@"hello.");
        }
            break;
            
        case Push:
            [self transitionWithType:kCATransitionPush WithSubtype:subtypeString ForView:self.view];
            break;
            
        case Reveal:
            [self transitionWithType:kCATransitionReveal WithSubtype:subtypeString ForView:self.view];
            break;
            
        case MoveIn:
            [self transitionWithType:kCATransitionMoveIn WithSubtype:subtypeString ForView:self.view];
            break;
            
        case Cube:
            [self transitionWithType:@"cube" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case SuckEffect:
            [self transitionWithType:@"suckEffect" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case OglFlip:
            [self transitionWithType:@"oglFlip" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case RippleEffect:
            [self transitionWithType:@"rippleEffect" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case PageCurl:
            [self transitionWithType:@"pageCurl" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case PageUnCurl:
            [self transitionWithType:@"pageUnCurl" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case CameraIrisHollowOpen:
            [self transitionWithType:@"cameraIrisHollowOpen" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case CameraIrisHollowClose:
            [self transitionWithType:@"cameraIrisHollowClose" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case CurlDown:
            [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionCurlDown];
            break;
            
        case CurlUp:
            [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionCurlUp];
            break;
            
        case FlipFromLeft:
            [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionFlipFromLeft];
            break;
            
        case FlipFromRight:
            [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionFlipFromRight];
            break;
            
        default:
            break;
    }
    
    static int i = 0;
    if (i == 0) {
        [self addBgImageWithImageName:IMAGE1];
        i = 1;
    }
    else
    {
        [self addBgImageWithImageName:IMAGE2];
        i = 0;
    }
}
#pragma mark - CATransition动画实现
- (void) transitionWithType:(NSString *) type WithSubtype:(NSString *) subtype ForView:(UIView *)view
{
    //创建CATransition对象
    CATransition *animation = [CATransition animation];
    
    //设置运动时间
    animation.duration = DURATION;
    
    // 设置运动type
    animation.type = type;
    if(subtype != nil)
        // 设置子类
        animation.subtype = subtype;
    // 设置运动速度
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    
    [view.layer addAnimation: animation forKey: @"animation"];
}

#pragma mark - UIView实现动画
- (void) animationWithView:(UIView *)view WithAnimationTransition:(UIViewAnimationTransition)transition;
{
    [UIView animateWithDuration: DURATION animations: ^{
        [UIView setAnimationCurve: UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition: transition forView: view cache: YES];
    }];
}

#pragma mark - 给View添加背景图
- (void)addBgImageWithImageName:(NSString *)imageName
{
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:imageName]];
}

@end
