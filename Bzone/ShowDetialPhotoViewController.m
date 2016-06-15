//
//  ShowDetialPhotoViewController.m
//  Bzone
//
//  Created by expai on 16/6/15.
//  Copyright © 2016年 guangJun.com.cn. All rights reserved.
//

#import "ShowDetialPhotoViewController.h"

@interface ShowDetialPhotoViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation ShowDetialPhotoViewController
- (IBAction)dismissVc:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageV.contentMode = UIViewContentModeScaleAspectFit;
    _imageV.image = _img;
}


@end
