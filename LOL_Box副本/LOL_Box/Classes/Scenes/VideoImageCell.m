//
//  VideoImageCell.m
//  LOL_Box
//
//  Created by lanou3g on 15/11/19.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import "VideoImageCell.h"

@implementation VideoImageCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addCustomView];
    }
    return self;
}- (void)addCustomView{
    self.imgView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
    [self.contentView addSubview:_imgView];
    
    self.footerTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 90, 90, 20)];
    _footerTitleLabel.font = [UIFont systemFontOfSize:15];
    _footerTitleLabel.textColor = [UIColor grayColor];
    _footerTitleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_footerTitleLabel];
}

@end
