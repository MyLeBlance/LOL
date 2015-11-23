//
//  ToolCell.m
//  LOL_Box
//
//  Created by lanou3g on 15/11/18.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import "ToolCell.h"

@implementation ToolCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addCustomView];
    }
    return self;
}

- (void)addCustomView{
    
    //创建并初始化
    self.imageView= [[UIImageView alloc] initWithFrame:self.contentView.bounds];
    //添加到内容视图
    [self.contentView addSubview:_imageView];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 75, 75, 20)];
    _titleLabel.font = [UIFont systemFontOfSize:13];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_titleLabel];
}

@end
