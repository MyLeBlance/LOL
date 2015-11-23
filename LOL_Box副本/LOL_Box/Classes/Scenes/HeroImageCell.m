//
//  HeroImageCell.m
//  LOL_Box
//
//  Created by lanou3g on 15/11/16.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import "HeroImageCell.h"

@implementation HeroImageCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addCustomView];
    }
    return self;
}

//添加全部控件
- (void)addCustomView{
    
    //周免英雄
    //创建并初始化
    self.heroImageView= [[UIImageView alloc] initWithFrame:self.contentView.bounds];
    //图片下面的中文名字
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 90, 90, 30)];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.font = [UIFont systemFontOfSize:15];
    [_heroImageView addSubview:_titleLabel];
    //添加到内容视图
    [self.contentView addSubview:_heroImageView];
    
}

@end




#warning --- 需要记住（半透明的黑色）
//    _label.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
