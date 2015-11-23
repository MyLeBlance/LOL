//
//  VideoDataManager.h
//  LOL_Box
//
//  Created by lanou3g on 15/11/20.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailVideoModel.h"

typedef void(^UpdataUI) ();

@interface VideoDataManager : NSObject

@property (nonatomic, copy) UpdataUI myUpdataUI;
//向外界提供一个借口
@property (nonatomic, strong) NSArray *allVideo;

//创建单例
+ (VideoDataManager *)shareVideoManagetr;

@end
