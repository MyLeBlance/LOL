//
//  HeroDetailManager.m
//  LOL_Box
//
//  Created by lanou3g on 15/11/23.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import "HeroDetailManager.h"

@implementation HeroDetailManager

// 英雄详情   // 资料",@"技能",@"视频",@"出装",@"配音",@"皮肤"
#define kHeroDeatailURL @"http://box.dwstatic.com/skin/Yasuo/Yasuo_Splash_0.jpg"
// 英雄视频
#define KHeroDetailVideo @"http://box.dwstatic.com/apiVideoesNormalDuowan.php?action=l&p=1&v=108&OSType=iOS8.3&tag=Yasuo&src=letv"

static HeroDetailManager *manager = nil;
+ (HeroDetailManager *)shareManagerWithIndex:(NSInteger)index{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [HeroDetailManager new];
    });
    [manager requestDataWithIndex:index];
    return manager;
}

- (void)requestDataWithIndex:(NSInteger)index{
    
    NSArray *array = @[kHeroDeatailURL, KHeroDetailVideo];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSURL *url = [NSURL URLWithString:array[index]];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (data != nil) {
                
            }
            
        }];
    });
}

@end
