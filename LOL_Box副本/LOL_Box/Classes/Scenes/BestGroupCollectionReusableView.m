//
//  BestGroupCollectionReusableView.m
//  LOL_Box
//
//  Created by lanou3g on 15/11/19.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import "BestGroupCollectionReusableView.h"

@implementation BestGroupCollectionReusableView

//初始化
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.headerTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 394, 30)];
        [self addSubview:_headerTitleLabel];
        
        self.footerTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 394, 40)];
        _footerTitleLabel.font = [UIFont systemFontOfSize:13];
        _footerTitleLabel.numberOfLines = 2;
        _footerTitleLabel.textColor = [UIColor grayColor];
        [self addSubview:_footerTitleLabel];
    }
    return self;
}


@end
