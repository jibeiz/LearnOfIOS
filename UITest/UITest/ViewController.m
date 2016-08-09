//
//  ViewController.m
//  UITest
//
//  Created by yueng on 16/7/21.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import "ViewController.h"
#import "ImageViewController.h"
#import "BusinessViewController.h"
#define DURATION 0.7f

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *accountLabel;
@property (weak, nonatomic) IBOutlet UILabel *secretLabel;

@end

@implementation ViewController

#pragma mark - ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
//    [self addBgImageWithImageName: @"iphone6_2"];
    NSLog(@"ViewController's viewDidLoad is called.");
    // Do any additional setup after loading the view, typically from a nib.
    //NSLog(@"ViewController's viewDidLoad is called.");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"ViewController didReceiveMemoryWarning.");
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"prepareForSegue1 is called.");
    if([segue.destinationViewController isKindOfClass: [ImageViewController class]])
    {
        ImageViewController *ivr = (ImageViewController *)segue.destinationViewController;
        NSLog(@"****1****");
        if([segue.identifier isEqualToString: @"person"])
        {
            NSLog(@"****2****");
            ivr.imageURL = [NSURL URLWithString: @"http://i2.piimg.com/569882/a78a4a76a8e942cd.png"];
            NSLog(@"****3****");
        }
        else if([segue.identifier isEqualToString: @"business"])
            ivr.imageURL = [NSURL URLWithString: @"http://i2.piimg.com/569882/435bf3206cc6567a.png"];
        ivr.title = segue.identifier;
    }
    else if([segue.destinationViewController isKindOfClass: [BusinessViewController class]])
    {
        BusinessViewController *ivr = (BusinessViewController *)segue.destinationViewController;
        //        NSLog(@"****1****");
        if([segue.identifier isEqualToString: @"person"])
        {
            //            NSLog(@"****2****");
            ivr.imageURL = [NSURL URLWithString: @"http://i2.piimg.com/569882/a78a4a76a8e942cd.png"];
            //            NSLog(@"****3****");
        }
        else if([segue.identifier isEqualToString: @"business"])
            ivr.imageURL = [NSURL URLWithString: @"http://i2.piimg.com/569882/435bf3206cc6567a.png"];
        ivr.title = segue.identifier;
    }
//    NSLog(@"prepareForSegue is called.");
    self.textView.text = @"Welcome to login.";
    NSLog(@"prepareForSegue is end.");
}

#pragma mark - textField
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    self.textView.text = textField.text;
    [textField resignFirstResponder];
    NSLog(@"ViewController textFieldShouldReturn.");
    return YES;
}

#pragma mark - Click
- (IBAction)longinClick:(UIButton *)sender {
    NSLog(@"Login begin");
    //NSLog(@"accountText = %@, secretText = %@", self.accountText.text, self.secretText.text);
    //NSLog(@"%d, %d", [self.accountText.text isEqualToString: @"admin"], [self.secretText.text isEqualToString: @"admin"]);
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"userData" ofType:@"plist"];
    NSArray *userArray = [[NSArray alloc] initWithContentsOfFile: plistPath];
    NSString *account = [self.accountText.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *secret = [self.secretText.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    BOOL pass = NO;
    for(int i = 0; i < [userArray count]; i++)
    {
        if([account isEqualToString: userArray[i][0]] || [secret isEqualToString: userArray[i][1]])
            pass = YES;
    }
    if(pass)
    {
//        NSLog(@"Login successful.");
        [self transitionWithType:@"rippleEffect" WithSubtype:kCATransitionFromTop ForView:self.view];
        [self performSegueWithIdentifier: @"loginScene" sender: nil];
    }
}

- (IBAction)unwindSceneAViewController: (UIStoryboard *)segue
{
    NSLog(@"unwindSceneAViewController is called.");
}

#pragma mark - 给View添加背景图
- (void)addBgImageWithImageName:(NSString *)imageName
{
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:imageName]];
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

@end
