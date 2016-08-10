//
//  TableViewController.m
//  Demo_SuspendButton
//
//  Created by Ihefe_Hanrovey on 16/8/10.
//  Copyright © 2016年 Ihefe_Hanrovey. All rights reserved.
//  使用UIWindow创建悬浮的按钮,剩余的一些按钮比如拖动等手势，有待自己拓展。。。。。。。。

#import "TableViewController.h"
@interface TableViewController()
@property(strong,nonatomic)UIWindow *window;
@property(strong,nonatomic)UIButton *button;
@end

@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self performSelector:@selector(createSuspendButton) withObject:nil afterDelay:1];
    
}

#pragma mark - 创建悬浮的按钮
- (void)createSuspendButton
{
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button setTitle:@"悬浮按钮" forState:UIControlStateNormal];
    _button.frame = CGRectMake(0, 0, 80, 80);
    [_button addTarget:self action:@selector(closeWindow) forControlEvents:UIControlEventTouchUpInside];
    
    _window = [[UIWindow alloc]initWithFrame:CGRectMake(100, 200, 80, 80)];
    _window.windowLevel = UIWindowLevelAlert + 1;
    _window.backgroundColor = [UIColor redColor];
    _window.layer.cornerRadius = 40;
    _window.layer.masksToBounds = YES;
    [_window addSubview:_button];
    [_window makeKeyAndVisible];//关键语句,显示window
}

#pragma mark - 关闭悬浮的window
- (void)closeWindow
{
    [_window resignKeyWindow];
    _window = nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    cell.textLabel.text = @"111111";
    return cell;
}
@end
