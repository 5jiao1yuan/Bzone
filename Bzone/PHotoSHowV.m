//
//  PHotoSHowV.m
//  Bzone
//
//  Created by expai on 16/6/15.
//  Copyright © 2016年 guangJun.com.cn. All rights reserved.
//

#import "PHotoSHowV.h"
#import "ShowDetialPhotoViewController.h"
#import "UIView+FindVc.h"
@implementation PHotoSHowV

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        CGFloat margin = 5;
        self.backgroundColor = [UIColor lightGrayColor];
        self.frame = CGRectMake(margin, margin, [UIScreen mainScreen].bounds.size.width - 20-2* margin, 200);
        
        
    }
    return self;
}


- (void)initPhotos:(NSString *)names bolok:(void (^)(CGFloat viewHeight))block
{
    NSArray *photos = [names componentsSeparatedByString:@"/"];
    CGFloat margin = 5;
    CGFloat WH = (self.frame.size.width -margin * 4)/3;
    CGFloat maxHeight = 0;
    for (NSInteger i=0; i<photos.count; i++) {

        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(margin +(margin + WH)*(i%3), margin +(margin+WH)*(i/3), WH, WH)];
        [btn setBackgroundImage:[UIImage imageNamed:photos[i]] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor yellowColor];
        btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [btn addTarget:self action:@selector(selctPhotoAction:) forControlEvents:UIControlEventTouchUpInside];
        maxHeight = margin + CGRectGetMaxY(btn.frame);
        [self addSubview:btn];
    }
    block(maxHeight);
}

- (void)selctPhotoAction:(UIButton *)sender
{
    ShowDetialPhotoViewController *showDetailVc = [[ShowDetialPhotoViewController alloc]init];
    showDetailVc.img = sender.currentBackgroundImage;
    [self.viewController presentViewController:showDetailVc animated:NO completion:nil];
    
}

@end
