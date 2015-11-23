//
//  HeroDetailModel.h
//  LOL_Box
//
//  Created by lanou3g on 15/11/20.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeroDetailModel : NSObject

// 英雄配音
@property (nonatomic, retain) NSString *danceVideoPath;
// 英雄资料
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *displayName;
@property (nonatomic, retain) NSString *price;
@property (nonatomic, retain) NSString *heroDescription;

@end
