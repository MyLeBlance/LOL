//
//  HeroImageCell.h
//  LOL_Box
//
//  Created by lanou3g on 15/11/16.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FreeHeroModel.h"
#import "AllHeroModel.h"

@interface HeroImageCell : UICollectionViewCell

//加载图片
@property (nonatomic, retain) UIImageView *heroImageView;
//英雄图片下面的文字
@property (nonatomic, retain) UILabel *titleLabel;

@end
