//
//  HeroDetailViewController.h
//  LOL_Box
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeroDetailView.h"


@interface HeroDetailViewController : UIViewController

@property (nonatomic, retain) UIImageView *imgView;
@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UILabel *displayNameLabel;
@property (nonatomic, retain) UILabel *attackLabel;
@property (nonatomic, retain) UILabel *defenseLabel;
@property (nonatomic, retain) UILabel *magicArtsLabel;
@property (nonatomic, retain) UILabel *difficultyLabel;
@property (nonatomic, retain) UILabel *goldCoinLabel;
@property (nonatomic, retain) UILabel *priceLabel;
@property (nonatomic, retain) UILabel *DescriptionLabel;

@property (nonatomic, retain) HeroDetailView *heroDetailView;

@end