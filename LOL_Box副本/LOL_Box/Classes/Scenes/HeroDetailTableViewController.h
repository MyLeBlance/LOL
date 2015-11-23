//
//  HeroDetailTableViewController.h
//  LOL_Box
//
//  Created by lanou3g on 15/11/20.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "ViewPagerController.h"
@interface HeroDetailTableViewController : ViewPagerController

//属性传值，将第一个页面英雄的displayerName作为英雄详情页面的title
@property (nonatomic, retain) NSString *displayerNameString;

@end
