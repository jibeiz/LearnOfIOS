//
//  ViewController.m
//  plistDemo
//
//  Created by CodingDoge on 16/8/1.
//  Copyright © 2016年 CodingDoge. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (NSString *)plistFilePath;

@end

@implementation ViewController
/**
 *  mainView显示数据
    valueText输入想要添加的数据
    点击添加 输入内容写入文档
    点击显示 文档内容显示到mainView
 */
- (void)viewDidLoad {
        [super viewDidLoad];
    self.FilePathTest = @"data.plist";
    
//    NSBundle *mainBundle = [NSBundle mainBundle];
//    self.plistFilePath = [mainBundle pathForResource: @"data" ofType: @"plist"];
    self.plistFilePath = [self plistFilePath];
    self.valueText.clearsOnBeginEditing = YES;
    self.valueText.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.valueText.borderStyle = UITextBorderStyleRoundedRect;
    self.valueText.keyboardAppearance = UIKeyboardAppearanceAlert;
    
    // 读取文档 显示信息
    NSArray *array = [[NSMutableArray alloc] initWithContentsOfFile: self.plistFilePath];
    NSMutableString *mainView1 = [[NSMutableString alloc] init];
    for(NSString *obj in array)
    {
        [mainView1 appendString: obj];
    }
    self.mainView.text = mainView1;
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 找到文档路径 没有则生成
#pragma mark - plistFilePath
- (NSString *)plistFilePath;
{
    if(!_plistFilePath)
    {
       NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true) lastObject];
        //NSLog(@"doucumentDirectory: %@", documentDirectory);
        _plistFilePath = [documentDirectory stringByAppendingPathComponent: @"data.plist"];
        //NSLog(@"plistFilePaht: %@", _plistFilePath);
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if(![fileManager fileExistsAtPath: _plistFilePath])
        {
            [fileManager createFileAtPath: self.plistFilePath contents: nil attributes: nil];
        }
 
    }    
    return _plistFilePath;
}

#pragma mark - Button
// 显示信息
- (IBAction)viewButton:(id)sender {
//    NSLog(@"****1*****");
    NSArray *array = [[NSMutableArray alloc] initWithContentsOfFile: self.plistFilePath];
//    NSLog(@"****2*****");
    NSMutableString *mainView1 = [[NSMutableString alloc] init];
//    NSLog(@"%lu", (unsigned long)[array count]);
    for(NSString *obj in array)
    {
//        NSLog(@"****4****");
//        NSLog(@"%@", obj);
        [mainView1 appendString: obj];
    }
//    NSLog(@"****5****");
    self.mainView.text = mainView1;
}

// 添加信息
- (IBAction)addButton:(id)sender {
//    NSLog(@"%@", self.FilePathTest);
    NSArray *array = [[NSMutableArray alloc] initWithContentsOfFile: self.FilePathTest];
    NSMutableString *mainView1 = [[NSMutableString alloc] init];
    for(NSString *obj in array)
    {
//        NSLog(@"%@", obj);
        [mainView1 appendString: obj];
    }
    [mainView1 appendString: self.valueText.text];
    BOOL res = [mainView1 writeToFile: self.plistFilePath atomically: TRUE encoding: NSUTF8StringEncoding error:nil];
//    NSLog(@"res = %d", res);
    //NSAssert(res, @"写入文件错误");
//    [self.plistFilePath stringByExpandingTildeInPath]

}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    self.mainView.text = self.valueText.text;
    [textField resignFirstResponder];
    return YES;
}

/**
 *  Q: 想要做到输入完成后 valueText自动清空
 */
- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    self.valueText.text = @"";
    return YES;
}

#pragma mark - UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text isEqualToString: @"\n"])
    {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}
@end
