//
//  QQBaseViewController.m
//  QQ空间
//
//  Created by expai on 16/6/13.
//  Copyright © 2016年 guangJun.com.cn. All rights reserved.
//

#import "QQBaseViewController.h"
#import "QQTableViewCell.h"
#import "QQDataModel.h"
#define ScreenW     [UIScreen mainScreen].bounds.size.width
#define ScreenH     [UIScreen mainScreen].bounds.size.height

@interface QQBaseViewController()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) UITableView *qqTableView;

@end
@implementation QQBaseViewController
static NSString *cellID = @"cell";

- (NSMutableArray *)dataSource
{
    if(!_dataSource)
    {
        _dataSource = [NSMutableArray array];
        NSString *path = [[NSBundle mainBundle]pathForResource:@"datas" ofType:@"plist"];
        NSMutableArray *datas = [NSMutableArray arrayWithContentsOfFile:path];
        for (NSDictionary *dict in datas) {
            QQDataModel *data = [QQDataModel dataWithDict:dict];
            [_dataSource addObject:data];
        }
    }
    return _dataSource;
}
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
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QQTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.qqData = self.dataSource[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QQDataModel *qqM = self.dataSource[indexPath.row];
    NSLog(@"%d==>%f", indexPath.row, qqM.cellHeight);
    return qqM.cellHeight;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

@end
