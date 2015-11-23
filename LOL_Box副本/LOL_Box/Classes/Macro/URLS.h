//
//  URLS.h
//  LOL_Box
//
//  Created by lanou3g on 15/11/16.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#ifndef URLS_h
#define URLS_h

//免费英雄
#define kFreeHeroURL @"http://lolbox.duowan.com/phone/apiHeroes.php?type=free&v=108&OSType=iOS8.3"
//全部英雄
#define kAllHeroURL @"http://lolbox.duowan.com/phone/apiHeroes.php?type=all&v=108&OSType=iOS8.3"
//英雄详情
#define kheroDetail @"http://lolbox.duowan.com/phone/apiHeroDetail.php?OSType=iOS8.3&heroName=Yasuo&v=108"

//装备分类
#define kNewsURL @"http://lolbox.duowan.com/phone/apiZBCategory.php?v=108&OSType=iOS8.3&versionName=2.2.5"
//工具装备
#define kToolURL @"http://lolbox.duowan.com/phone/apiZBItemList.php?tag=%@&v=108&OSType=iOS8.3&versionName=2.2."

//分类视频
#define kVideoURL @"http://box.dwstatic.com/apiVideoesNormalDuowan.php?src=duowan&action=c&sk=&sn=&pn="
//视频列表
#define kVideoListURL @"http://box.dwstatic.com/apiVideoesNormalDuowan.php?src=duowan&action=l&sk=&pageUrl=&heroEnName=&tag=topN&p=1"

//News中的头条
#define kHeaderlineURL @"http://box.dwstatic.com/apiNewsList.php?action=l&newsTag=headlineNews&p=1"
//赛事
#define kGameURL @"http://box.dwstatic.com/apiNewsList.php?action=topic&topicId=68"
//靓照视图
#define kBeautifulPhotoURL @"http://box.dwstatic.com/apiAlbum.php?action=l&albumsTag=wallpaper&p=1"
//最佳阵容
#define kBestGroup @"http://box.dwstatic.com/apiHeroBestGroup.php?v=108&OSType=iOS8.3"


#endif /* URLS_h */
