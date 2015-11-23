//
//  HeroDetailManager.h
//  LOL_Box
//
//  Created by lanou3g on 15/11/23.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^UpdataUI) ();

@interface HeroDetailManager : NSObject

@property (nonatomic, retain) NSMutableArray *detailArray;
@property (nonatomic, copy) UpdataUI myUpdataUI;

+ (HeroDetailManager *)shareManagerWithIndex:(NSInteger)index;

@end
