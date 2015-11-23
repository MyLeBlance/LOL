//
//  BestGroup.m
//  LOL_Box
//
//  Created by lanou3g on 15/11/19.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import "BestGroup.h"

@implementation BestGroup

//容错处理
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

- (NSString *)description{
    return [NSString stringWithFormat:@"%@", _title];
}

@end
