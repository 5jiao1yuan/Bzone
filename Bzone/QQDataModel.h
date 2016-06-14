//
//  QQDataModel.h
//  Bzone
//
//  Created by expai on 16/6/14.
//  Copyright © 2016年 guangJun.com.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface QQDataModel : NSObject

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, assign) BOOL vip;
@property (nonatomic, copy) NSString *sendTime;
@property (nonatomic, copy) NSString  *content;
@property (nonatomic, assign) BOOL isContent;
@property (nonatomic, copy) NSString *moreImages;
@property (nonatomic, assign) BOOL ismoreImages;
@property (nonatomic, copy) NSString *device;
@property (nonatomic, copy) NSString *showZan;
@property (nonatomic, assign) BOOL isShowZan;
@property (nonatomic, strong) NSArray *commentV;
@property (nonatomic, assign) BOOL isCommentV;

@property (assign, nonatomic) CGFloat cellHeight;
+(instancetype)dataWithDict:(NSDictionary *)dict;

@end
