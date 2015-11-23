//
//  BestGroupCell.m
//  LOL_Box
//
//  Created by lanou3g on 15/11/19.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import "BestGroupCell.h"

@implementation BestGroupCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addCustomView];
    }
    return self;
}

- (void)addCustomView{
    self.bestGroupImgView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
    
    [self.contentView addSubview:_bestGroupImgView];
}

@end
