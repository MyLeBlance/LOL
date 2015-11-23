//
//  VideoCollectionReusableView.m
//  LOL_Box
//
//  Created by lanou3g on 15/11/18.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import "VideoCollectionReusableView.h"

@implementation VideoCollectionReusableView

//初始化
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.headerTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 200, 30)];
        _headerTitleLabel.font = [UIFont systemFontOfSize:20];
        [self addSubview:_headerTitleLabel];
    }
    return self;
}

@end
