//
//  ToolDetail.m
//  LOL_Box
//
//  Created by lanou3g on 15/11/18.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import "ToolDetail.h"

@implementation ToolDetail

//容错处理
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        _ID = [value intValue];
    }
}

//重写description方法
- (NSString *)description{
    return [NSString stringWithFormat:@"%@", _text];
}

@end
