//
//  HeroDetailView.m
//  LOL_Box
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import "HeroDetailView.h"

@implementation HeroDetailView

//容错处理
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"description"]) {
        _Description = value;
    }
}

//重写description方法
- (NSString *)description{
    return [NSString stringWithFormat:@"%@", _title];
}

@end
