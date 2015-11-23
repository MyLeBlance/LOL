//
//  HeroDetailView.h
//  LOL_Box
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeroDetailView : NSObject

@property (nonatomic, retain) UIImage *imgView;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *displayName;
@property (nonatomic, retain) NSString *attack;
@property (nonatomic, retain) NSString *defense;
@property (nonatomic, retain) NSString *magicArts;
@property (nonatomic, retain) NSString *difficulty;
@property (nonatomic, assign) int goldCoin;
@property (nonatomic, assign) int price;
@property (nonatomic, retain) NSString *Description;


@end
