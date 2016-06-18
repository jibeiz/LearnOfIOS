//
//  ViewController.h
//  SwitchSliderSegmentedControlSample
//
//  Created by cherry on 12-9-7.
//  本书网站：http://www.iosbook1.com
//  智捷iOS课堂：http://www.51work6.com
//  智捷iOS课堂在线课堂：http://v.51work6.com
//  智捷iOS课堂新浪微博：http://weibo.com/u/3215753973
//  作者微博：http://weibo.com/516inc
//  官方csdn博客：http://blog.csdn.net/tonny_guan
//  QQ：1575716557 邮箱：jylong06@163.com
//
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISwitch *rightSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *leftSwitch;
@property (weak, nonatomic) IBOutlet UILabel *SliderValue;


- (IBAction)switchValueChanged:(id)sender;
- (IBAction)touchDown:(id)sender;
- (IBAction)sliderValueChange:(id)sender;


@end
