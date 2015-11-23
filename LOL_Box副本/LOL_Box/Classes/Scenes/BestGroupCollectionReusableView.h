//
//  BestGroupCollectionReusableView.h
//  LOL_Box
//
//  Created by lanou3g on 15/11/19.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BestGroupCollectionReusableView : UICollectionReusableView

//创建一个lable用于显示上面的标题
@property (nonatomic, retain) UILabel *headerTitleLabel;

@property (nonatomic, retain) UILabel *footerTitleLabel;

@end
