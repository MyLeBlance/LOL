//
//  BeautifulPhotoCollectionCell.m
//  LOL_Box
//
//  Created by lanou3g on 15/11/23.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import "BeautifulPhotoCollectionCell.h"

@implementation BeautifulPhotoCollectionCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addCustomView];
    }
    return self;
}

//添加全部控件
- (void)addCustomView{
    
    //创建并初始化
    self.beautifulImageView= [[UIImageView alloc] initWithFrame:self.contentView.bounds];
    //图片下面的中文名字
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 180, 180, 50)];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    _titleLabel.font = [UIFont systemFontOfSize:17];
    _titleLabel.numberOfLines = 2;
    _titleLabel.textColor = [UIColor whiteColor];
    [_beautifulImageView addSubview:_titleLabel];
    //添加到内容视图
    [self.contentView addSubview:_beautifulImageView];
    
}

@end
