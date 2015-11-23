//
//  VideoFLModel.m
//  LOL_Box
//
//  Created by lanou3g on 15/11/19.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import "VideoFLModel.h"

@implementation VideoFLModel

//容错处理
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
}

- (NSString *)description{
    return [NSString stringWithFormat:@"%@", _name];
}

@end
