//
//  NewsCollectionViewCell.m
//  LOL_Box
//
//  Created by lanou3g on 15/11/18.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import "NewsCollectionViewCell.h"

@implementation NewsCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addCustomView];
    }
    return self;
}

- (void)addCustomView{
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 100, 20)];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_titleLabel];
}

@end
