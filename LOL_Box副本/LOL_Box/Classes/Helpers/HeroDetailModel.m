//
//  HeroDetailModel.m
//  LOL_Box
//
//  Created by lanou3g on 15/11/20.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import "HeroDetailModel.h"

@implementation HeroDetailModel

// 容错处理
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"description"]) {
        _heroDescription = value;
    }
}

// 重写description方法
- (NSString *)description{
    return [NSString stringWithFormat:@"%@", _title];
}

@end
