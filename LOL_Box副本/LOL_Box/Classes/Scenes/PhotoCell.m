//
//  PhotoCell.m
//  LOL_Box
//
//  Created by lanou3g on 15/11/23.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import "PhotoCell.h"

@implementation PhotoCell

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
    _beautifulImageView.backgroundColor = [UIColor redColor];
    //添加到内容视图
    [self.contentView addSubview:_beautifulImageView];
    
}

@end
