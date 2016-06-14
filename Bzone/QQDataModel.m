//
//  QQDataModel.m
//  Bzone
//
//  Created by expai on 16/6/14.
//  Copyright © 2016年 guangJun.com.cn. All rights reserved.
//

#import "QQDataModel.h"

@implementation QQDataModel
+(instancetype)dataWithDict:(NSDictionary *)dict
{
    QQDataModel *data = [[self alloc]init];
    [data setValuesForKeysWithDictionary:dict];
    return data;
}
@end
