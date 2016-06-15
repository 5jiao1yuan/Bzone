//
//  UIView+FindVc.m
//  Bzone
//
//  Created by expai on 16/6/15.
//  Copyright © 2016年 guangJun.com.cn. All rights reserved.
//

#import "UIView+FindVc.h"

@implementation UIView (FindVc)

- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}
@end
