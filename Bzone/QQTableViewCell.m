//
//  QQTableViewCell.m
//  QQ空间
//
//  Created by expai on 16/6/13.
//  Copyright © 2016年 guangJun.com.cn. All rights reserved.
//

#import "QQTableViewCell.h"
#import <Masonry.h>
#import "QQDataModel.h"

@interface QQTableViewCell ()

@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *userName;
@property (nonatomic, strong) UIImageView *vip;
@property (nonatomic, strong) UILabel *sendTime;
@property (nonatomic, strong) UIButton *more;
@property (nonatomic, strong) UILabel *content;
@property (nonatomic, strong) UIView *moreImages;
@property (nonatomic, strong) UILabel *device;
@property (nonatomic, strong) UIView *appendV;
@property (nonatomic, strong) UILabel *showZan;
@property (nonatomic, strong) UITableView *commentV;
@property (nonatomic, strong) UITextField *textF;

@end

@implementation QQTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.icon = [[UIImageView alloc]init];
        [self.contentView addSubview:_icon];
        self.userName = [[UILabel alloc]init];
        [self.contentView addSubview:_userName];
        self.vip = [[UIImageView alloc]init];
        [self.contentView addSubview:_vip];
        self.sendTime = [[UILabel alloc]init];
        [self.contentView addSubview:_sendTime];
        self.more = [[UIButton alloc]init];
        [self.contentView addSubview:_more];
        self.content = [[UILabel alloc]init];
        _content.numberOfLines = 0;
        [self.contentView addSubview:_content];
        self.moreImages = [[UIView alloc]init];
        [self.contentView addSubview:_moreImages];
        self.device = [[UILabel alloc]init];
        [self.contentView addSubview:_device];
        self.appendV = [[UIView alloc]init];
        self.appendV.backgroundColor = [UIColor darkGrayColor];
        [self.contentView addSubview:_appendV];
        self.showZan = [[UILabel alloc]init];
        _showZan.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_showZan];
        self.commentV = [[UITableView alloc]init];
        _commentV.backgroundColor = [UIColor darkTextColor];
        [self.contentView addSubview:_commentV];
        self.textF = [[UITextField alloc]init];
        _textF.backgroundColor = [UIColor darkGrayColor];
        [self.contentView addSubview:_textF];
        
        self.content.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width-30;

    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.content.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width-30;
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {

    }
    return self;
}
- (void)setQqData:(QQDataModel *)qqData
{
    _qqData = qqData;
    CGFloat margin = 5;
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(margin);
        make.top.mas_offset(margin);
        make.width.height.mas_equalTo(40);
    }];
    self.icon.image = [UIImage imageNamed:qqData.icon];
    
    [self.more mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-margin);
        make.top.mas_equalTo(self.icon.mas_top);
        make.width.height.mas_equalTo(20);
    }];
    [self.more setBackgroundImage:[UIImage imageNamed:@"more.png"] forState:UIControlStateNormal];
    
    [self.userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.icon.mas_top);
        make.left.mas_equalTo(self.icon.mas_right).mas_offset(margin);
        make.height.mas_equalTo(20);
        make.width.mas_greaterThanOrEqualTo(20);
        make.width.mas_lessThanOrEqualTo(200);
    }];
    self.userName.text = qqData.userName;
    
    if(qqData.vip)
    {   self.vip.hidden = NO;
        [self.vip mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.userName.mas_right).mas_offset(margin);
            make.top.mas_equalTo(self.icon.mas_top);
            make.width.height.mas_equalTo(15);
        }];
        self.vip.image = [UIImage imageNamed:@"vip.png"];
    }else
    {
        self.vip.hidden = YES;
    }
    
    [self.sendTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.icon.mas_right).mas_offset(margin);
        make.top.mas_equalTo(self.userName.mas_bottom).mas_offset(margin/2);
        make.height.mas_equalTo(self.userName.mas_height);
        make.width.mas_greaterThanOrEqualTo(20);
        make.width.mas_lessThanOrEqualTo(140);
    }];
    self.sendTime.text = qqData.sendTime;
    
    if(qqData.isContent)
    {
        self.content.hidden = NO;
        [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.icon.mas_bottom).mas_offset(margin*2);
            make.left.mas_equalTo(self.icon.mas_left);
            make.right.mas_equalTo(self.more.mas_right);
        }];
        self.content.text = qqData.content;
    }else
    {
        self.content.hidden = YES;
        [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.icon.mas_bottom);
            make.left.mas_equalTo(self.icon.mas_left);
            make.right.mas_equalTo(self.more.mas_right);
            make.height.mas_equalTo(0);
        }];
    }
    if(qqData.ismoreImages)
    {
        self.moreImages.hidden = NO;
        [self.moreImages mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.content.mas_bottom).mas_offset(margin);
            make.left.mas_equalTo(self.icon.mas_left);
            make.right.mas_equalTo(self.more.mas_right);
        }];
    }
    else
    {
        self.moreImages.hidden = YES;
        [self.moreImages mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.content.mas_bottom).mas_offset(0);
            make.left.mas_equalTo(self.icon.mas_left);
            make.right.mas_equalTo(self.more.mas_right);
            make.height.mas_equalTo(0);
        }];
    }
    [self.device mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.moreImages.mas_bottom).mas_offset(margin);
        make.left.mas_equalTo(self.icon.mas_left);
        make.right.mas_equalTo(-200);
        make.height.mas_equalTo(24);
    }];
    self.device.text = qqData.device;
    
    [self.appendV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.device.mas_bottom).mas_offset(margin);
        make.left.mas_equalTo(self.icon.mas_left);
        make.right.mas_equalTo(self.more.mas_right);
        make.height.mas_equalTo(44);
    }];
    if(qqData.isShowZan)
    {
        self.showZan.hidden = NO;
        [self.showZan mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.appendV.mas_bottom).mas_offset(margin);
            make.left.mas_equalTo(self.icon.mas_left);
            make.right.mas_equalTo(self.more.mas_right);
            make.height.mas_equalTo(44);
        }];
        self.showZan.text = qqData.showZan;
    }else
    {
        self.showZan.hidden = YES;
        [self.showZan mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.appendV.mas_bottom).mas_offset(0);
            make.left.mas_equalTo(self.icon.mas_left);
            make.right.mas_equalTo(self.more.mas_right);
            make.height.mas_equalTo(0);
        }];
    }
    if(qqData.isCommentV)
    {
        self.commentV.hidden = NO;
        [self.commentV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.showZan.mas_bottom).mas_offset(margin);
            make.left.mas_equalTo(self.icon.mas_left);
            make.right.mas_equalTo(self.more.mas_right);
        }];
        
    }else
    {
        self.commentV.hidden = YES;
        [self.commentV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.showZan.mas_bottom).mas_offset(0);
            make.left.mas_equalTo(self.icon.mas_left);
            make.right.mas_equalTo(self.more.mas_right);
            make.height.mas_equalTo(0);
        }];
    }
   
    
    [self.textF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.commentV.mas_bottom).mas_offset(margin);
        make.left.mas_equalTo(self.icon.mas_left);
        make.right.mas_equalTo(self.more.mas_right);
        make.height.mas_equalTo(30);
    }];
    
    [self layoutIfNeeded];
    
    qqData.cellHeight = CGRectGetMaxY(self.textF.frame)+margin;
    
}
@end
