//
//  BViewController.m
//  NotificationDemo
//
//  Created by 贾金达 on 2020/7/27.
//  Copyright © 2020 jiajinda. All rights reserved.
//

#import "BViewController.h"

@interface BViewController ()
@property UITextField *textField;
@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.textField = [[UITextField alloc] init];
    self.textField.frame = CGRectMake(100, 300, 100, 30);
    [self.textField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.view addSubview:self.textField];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backClicked) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(0, 0, 60, 40);
    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = item;
    
}
- (void)backClicked{
    NSLog(@"返回");
    //notification通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"backButtonClicked" object:nil userInfo:@{@"msg":self.textField.text}];
    
    [self.navigationController popViewControllerAnimated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
