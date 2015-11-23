//
//  ToolOfNewsModel.m
//  LOL_Box
//
//  Created by lanou3g on 15/11/18.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import "ToolOfNewsModel.h"

@implementation ToolOfNewsModel

//容错处理
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

- (NSString *)description{
    return [NSString stringWithFormat:@"%@", _text];
}

@end
