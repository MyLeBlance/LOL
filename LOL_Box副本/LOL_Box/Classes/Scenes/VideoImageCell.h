//
//  VideoImageCell.h
//  LOL_Box
//
//  Created by lanou3g on 15/11/19.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoImageCell : UICollectionViewCell

//图片
@property (nonatomic, retain) UIImageView *imgView;

//在item区域下面贴一个标签
@property (nonatomic, retain) UILabel *footerTitleLabel;

@end
