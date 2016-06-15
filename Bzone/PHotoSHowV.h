//
//  PHotoSHowV.h
//  Bzone
//
//  Created by expai on 16/6/15.
//  Copyright © 2016年 guangJun.com.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PHotoSHowV : UIView

- (void)initPhotos:(NSString *)names bolok:(void (^)(CGFloat viewHeight))block;
@end
