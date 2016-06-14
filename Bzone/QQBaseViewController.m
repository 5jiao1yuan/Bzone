//
//  QQBaseViewController.m
//  QQ空间
//
//  Created by expai on 16/6/13.
//  Copyright © 2016年 guangJun.com.cn. All rights reserved.
//

#import "QQBaseViewController.h"
#import "QQTableViewCell.h"
#define ScreenW     [UIScreen mainScreen].bounds.size.width
#define ScreenH     [UIScreen mainScreen].bounds.size.height

@interface QQBaseViewController()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *qqTableView;

@end
@implementation QQBaseViewController
static NSString *cellID = @"cell";
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.qqTableView = [[UITableView alloc]initWithFrame:CGRectMake(10, 0, ScreenW-20, ScreenH)];
    self.qqTableView.delegate = self;
    self.qqTableView.dataSource = self;
    [self.view addSubview:_qqTableView];
    [self.qqTableView registerClass:[QQTableViewCell class] forCellReuseIdentifier:cellID];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QQTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 300;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

@end
