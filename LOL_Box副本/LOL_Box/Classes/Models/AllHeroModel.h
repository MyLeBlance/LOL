//
//  AllHeroModel.h
//  LOL_Box
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AllHeroModel : NSObject

//中文名
@property (nonatomic, retain) NSString *cnName;
//英文名
@property (nonatomic, retain) NSString *enName;
//位置
@property (nonatomic, retain) NSString *location;
//价格
@property (nonatomic, assign) NSInteger price;
//rating
@property (nonatomic, retain) NSString *rating;
//tags
@property (nonatomic, retain) NSString *tags;
//title
@property (nonatomic, retain) NSString *title;

@end
