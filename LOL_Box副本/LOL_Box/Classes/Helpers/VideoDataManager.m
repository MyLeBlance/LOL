//
//  VideoDataManager.m
//  LOL_Box
//
//  Created by lanou3g on 15/11/20.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import "VideoDataManager.h"
#import "DetailVideoModel.h"

@interface VideoDataManager ()

//用于承接解析的对象
@property (nonatomic, retain) NSMutableArray *videoListArray;

@end

@implementation VideoDataManager

static VideoDataManager *manager = nil;
+ (VideoDataManager *)shareVideoManagetr{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [VideoDataManager new];
        [manager requestData];
    });
    return manager;
}

- (void)requestData{
    
    //网络解析
    NSMutableURLRequest *videoRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:kVideoListURL]];
    NSURLSession *videoSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [videoSession dataTaskWithRequest:videoRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:&error];
        for (NSDictionary *dict in array) {
            DetailVideoModel *detailVideoModel = [DetailVideoModel new];
            [detailVideoModel setValuesForKeysWithDictionary:dict];
            [_videoListArray addObject:detailVideoModel];
            NSLog(@"%@", _videoListArray);
        }
        //返回主线程刷新数据
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!self.myUpdataUI) {
                NSLog(@"block没有代码");
            } else {
                self.myUpdataUI();
            }
        });
    }];
    [task resume];
    
    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSArray *dataArray = [NSArray arrayWithContentsOfURL:[NSURL URLWithString:kVideoListURL]];
//        
//        
//        NSLog(@"++++++%ld", dataArray.count);
//        
//        for (int i = 0; i < dataArray.count; i++) {
//            DetailVideoModel *detailVideoModel = [DetailVideoModel new];
//            [detailVideoModel setValuesForKeysWithDictionary:dataArray[i]];
//            [self.videoListArray addObject:detailVideoModel];
//        }
//        dispatch_async(dispatch_get_main_queue(), ^{
//            if (!self.myUpdataUI) {
//                NSLog(@"block没有代码");
//            } else {
//                self.myUpdataUI();
//            }
//        });
//    });
}

//懒加载
- (NSMutableArray *)videoListArray{
    if (!_videoListArray) {
        _videoListArray = [NSMutableArray new];
    }
    return _videoListArray;
}

//向外界提供一个接口
- (NSArray *)allVideo{
    return self.videoListArray;
}

@end
