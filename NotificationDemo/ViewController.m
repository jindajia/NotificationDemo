//
//  ViewController.m
//  NotificationDemo
//
//  Created by 贾金达 on 2020/7/27.
//  Copyright © 2020 jiajinda. All rights reserved.
//

#import "ViewController.h"
#import "BViewController.h"
@interface ViewController ()
@property UIButton *button1;
@property UILabel *label1;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor cyanColor];
    [self createButton];
    [self createLabel];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(xxx:) name:@"backButtonClicked" object:nil];
    
}
- (void)createButton{
    self.button1 = [[UIButton alloc] initWithFrame:CGRectMake(300, 300, 100, 60)];
    [self.button1 setBackgroundColor: [UIColor blueColor]];
    [self.button1 setTitle:@"救命" forState:UIControlStateNormal];
    [self.button1 setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [self.button1 addTarget:self action:@selector(nextPage)forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button1];
}
- (void)createLabel{
    self.label1 = [[UILabel alloc]init];
    [self.label1 setText:@"First Page"];
    self.label1.frame = CGRectMake(300, 400, 100, 40);
    [self.view addSubview:self.label1];
}
- (void)nextPage{
    BViewController *nextViewController = [[BViewController alloc] init];
    [self.navigationController pushViewController:nextViewController animated:YES];
}
-(void)xxx : (NSNotification*)notification{
    NSLog(@"%@",notification);
    NSDictionary *userInfo = notification.userInfo;
    NSLog(@"%@",[userInfo objectForKey:@"msg"]);
    self.label1.text = [userInfo objectForKey:@"msg"];
}
@end
