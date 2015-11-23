//
//  HeroCollectionReusableView.m
//  LOL_Box
//
//  Created by lanou3g on 15/11/16.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import "HeroCollectionReusableView.h"

@implementation HeroCollectionReusableView

//初始化
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 200, 30)];
        _titleLabel.font = [UIFont systemFontOfSize:20];
        [self addSubview:_titleLabel];
    }

    return self;
}

@end
