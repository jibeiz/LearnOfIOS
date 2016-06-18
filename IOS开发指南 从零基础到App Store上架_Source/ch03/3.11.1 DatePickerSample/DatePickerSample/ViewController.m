//
//  ViewController.m
//  DatePickerSample
//
//  Created by 关东升 on 12-8-7.
//  本书网站：http://www.iosbook1.com
//  智捷iOS课堂：http://www.51work6.com
//  智捷iOS课堂在线课堂：http://v.51work6.com
//  智捷iOS课堂新浪微博：http://weibo.com/u/3215753973
//  作者微博：http://weibo.com/516inc
//  官方csdn博客：http://blog.csdn.net/tonny_guan
//  QQ：1575716557 邮箱：jylong06@163.com
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)onclick:(id)sender {
    
    NSDate * theDate = self.datePicker.date;
	NSLog(@"the date picked is: %@", [theDate descriptionWithLocale:[NSLocale currentLocale]]);
	NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init] ;
	[dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSLog(@"the date formate is: %@", [dateFormatter stringFromDate:theDate]);
	self.label.text = [dateFormatter stringFromDate:theDate];
    
}
@end
