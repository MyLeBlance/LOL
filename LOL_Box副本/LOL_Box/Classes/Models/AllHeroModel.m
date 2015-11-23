//
//  AllHeroModel.m
//  LOL_Box
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import "AllHeroModel.h"

@implementation AllHeroModel

//容错处理
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

//重写description方法
- (NSString *)description{
    return [NSString stringWithFormat:@"%@", _cnName];
}

@end
