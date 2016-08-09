//
//  CALayerAnimitionViewController.m
//  CATransitionDemo
//
//  Created by CodingDoge on 16/7/28.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import "CALayerAnimitionViewController.h"
#define DURATION 0.7f

@interface CALayerAnimitionViewController ()

typedef enum : NSUInteger {
    Position = 1,                   //平移
    Opacity,                        //透明度变化
    Bounds,                         //界限
    Transform_rotation_z,           //旋转
    Transform_scale,                //缩放
    Combina                         //组合
    
} AnimationType;

@property (nonatomic, strong) CABasicAnimation *scaleAnimation;
@property (nonatomic, strong) CABasicAnimation *positionAnimation;
@property (nonatomic, strong) CABasicAnimation *opacityAnimation;
@property (nonatomic, strong) CABasicAnimation *boundsAnimation;
@property (nonatomic, strong) CABasicAnimation *rotationAnimation;


@end

@implementation CALayerAnimitionViewController

- (void)setScaleAnimation:(CABasicAnimation *)scaleAnimation
{
    _scaleAnimation = scaleAnimation;
    _scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    _scaleAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    _scaleAnimation.toValue = [NSNumber numberWithFloat:1.0];
    _scaleAnimation.duration = 2.0f;
    _scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    _scaleAnimation.removedOnCompletion = NO;
    _scaleAnimation.fillMode = kCAFillModeRemoved;
}
- (void)setPositionAnimation:(CABasicAnimation *)positionAnimation
{
    _positionAnimation = positionAnimation;
    _positionAnimation  = [CABasicAnimation animationWithKeyPath: @"position"];
    _positionAnimation.fromValue =  [NSValue valueWithCGPoint: self.logoLayer.position];
    CGPoint toPoint = self.logoLayer.position;
    toPoint.x += 180;
    _positionAnimation.toValue = [NSValue valueWithCGPoint:toPoint];
    
    _positionAnimation.removedOnCompletion = YES;
    _positionAnimation.fillMode = kCAFillModeForwards;
    _positionAnimation.duration = DURATION;

}
- (void)setOpacityAnimation:(CABasicAnimation *)opacityAnimation
{
    _opacityAnimation = opacityAnimation;
    _opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    _opacityAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    _opacityAnimation.toValue = [NSNumber numberWithFloat:0.1];
    
    _opacityAnimation.removedOnCompletion = NO;
    _opacityAnimation.fillMode = kCAFillModeRemoved;
    _opacityAnimation.duration = 2.0f;
}
- (void)setBoundsAnimation:(CABasicAnimation *)boundsAnimation
{
    _boundsAnimation = boundsAnimation;
    _boundsAnimation = [CABasicAnimation animationWithKeyPath:@"bounds"];
    _boundsAnimation.fromValue = [NSValue valueWithCGRect: self.logoLayer.bounds];
    _boundsAnimation.toValue = [NSValue valueWithCGRect:CGRectZero];
    _boundsAnimation.removedOnCompletion = NO;
    _boundsAnimation.fillMode = kCAFillModeRemoved;
    _boundsAnimation.duration = DURATION;
}
- (void)setRotationAnimation:(CABasicAnimation *)rotationAnimation
{
    _rotationAnimation = rotationAnimation;
    _rotationAnimation =
    [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];//"z"还可以是“x”“y”，表示沿z轴旋转
    _rotationAnimation.toValue = [NSNumber numberWithFloat:(2 * M_PI) * 3];
    // 3 is the number of 360 degree rotations
    // Make the rotation animation duration slightly less than the other animations to give it the feel
    // that it pauses at its largest scale value
    _rotationAnimation.duration = 2.0f;
    _rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]; //缓入缓出
    
    _rotationAnimation.removedOnCompletion = NO;
    _rotationAnimation.fillMode = kCAFillModeRemoved;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.logoLayer = [CALayer layer];
    self.logoLayer.bounds=CGRectMake(50, 0, 50, 80);
    self.logoLayer.backgroundColor=[UIColor blueColor].CGColor;
    self.logoLayer.position=CGPointMake(100, 100);
    self.logoLayer.anchorPoint=CGPointMake(0, 0);
    self.logoLayer.cornerRadius=20;
    
    [self.view.layer addSublayer: self.logoLayer];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClick:(id)sender
{
    UIButton *button = sender;
    AnimationType type = button.tag;
    switch (type) {
        case Position:
        {
            self.positionAnimation = [CABasicAnimation animation];
            [self.logoLayer addAnimation:self.positionAnimation forKey:nil];
            break;
        }
        case Opacity:
        {
            self.opacityAnimation = [CABasicAnimation animation];
            [self.logoLayer addAnimation:self.opacityAnimation forKey:nil];
            break;
        }
        case Bounds:
        {
            self.boundsAnimation = [CABasicAnimation animation];
            [self.logoLayer addAnimation:self.boundsAnimation forKey:nil];
            break;
        }
        case Transform_rotation_z:
        {
            self.rotationAnimation = [CABasicAnimation animation];
            [self.logoLayer addAnimation:self.rotationAnimation forKey:nil];
            break;
        }
        case Transform_scale:
        {
            self.scaleAnimation = [CABasicAnimation animation];
            [self.logoLayer addAnimation:self.scaleAnimation forKey:nil];
            break;
        }
        case Combina:
        {
            CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
            animationGroup.duration = 2.0f;
            animationGroup.autoreverses = YES;   //是否重播，原动画的倒播
            animationGroup.repeatCount = NSNotFound;//HUGE_VALF;     //HUGE_VALF,源自math.h
            self.rotationAnimation = [CABasicAnimation animation];
            self.scaleAnimation = [CABasicAnimation animation];
            [animationGroup setAnimations:[NSArray arrayWithObjects:self.rotationAnimation, self.scaleAnimation, nil]];
            [self.logoLayer addAnimation:animationGroup forKey:@"animationGroup"];
            break;
        }
            
        default:
            break;
    }
}

//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//     //1.创建核心动画
//     //    CABasicAnimation *anima=[CABasicAnimation animationWithKeyPath:<#(NSString *)#>]
//     CABasicAnimation *animation=[CABasicAnimation animation];
//
//     //1.1告诉系统要执行什么样的动画
//     animation.keyPath=@"position";
//     //设置通过动画，将layer从哪儿移动到哪儿
//     animation.fromValue=[NSValue valueWithCGPoint:CGPointMake(0, 0)];
//     animation.toValue=[NSValue valueWithCGPoint:CGPointMake(200, 300)];
//
//     //1.2设置动画执行完毕之后不删除动画
//     animation.removedOnCompletion=NO;
//     //1.3设置保存动画的最新状态
//     animation.fillMode=kCAFillModeForwards;
//
//     //2.添加核心动画到layer
//     [self.logoLayer addAnimation:animation forKey:nil];
// 
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
