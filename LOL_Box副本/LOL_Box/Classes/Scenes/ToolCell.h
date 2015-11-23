//
//  ToolCell.h
//  LOL_Box
//
//  Created by lanou3g on 15/11/18.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToolCell : UICollectionViewCell

//加载图片
@property (nonatomic, retain) UIImageView *imageView;
//创建一个lable用于显示装备的标题
@property (nonatomic, retain) UILabel *titleLabel;

@end
