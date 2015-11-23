//
//  DetailVideoModel.h
//  LOL_Box
//
//  Created by lanou3g on 15/11/20.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailVideoModel : NSObject

//cell左边的图片
@property (nonatomic, retain) NSString *cover_url;
//cell右边偏上的标题
@property (nonatomic, retain) NSString *title;
//cell右边偏下的更新时间
@property (nonatomic, retain) NSString *upload_time;
//cell视频的点击量
@property (nonatomic, retain) NSString *amount_play;

@end
