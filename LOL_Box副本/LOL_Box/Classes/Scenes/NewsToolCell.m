//
//  NewsToolCell.m
//  LOL_Box
//
//  Created by lanou3g on 15/11/18.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import "NewsToolCell.h"

@implementation NewsToolCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addCustomView];
    }
    return self;
}

- (void)addCustomView{
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 80, 90, 20)];
    _titleLabel.font = [UIFont systemFontOfSize:13];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textColor = [UIColor whiteColor];
    [self.contentView addSubview:_titleLabel];
}



@end
