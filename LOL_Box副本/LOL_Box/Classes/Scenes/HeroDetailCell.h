//
//  HeroDetailCell.h
//  LOL_Box
//
//  Created by lanou3g on 15/11/20.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeroDetailModel.h"

@interface HeroDetailCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imgView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *displayNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *goldCoinLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;




/*
@property (nonatomic, retain) UIImageView *imgView;
@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UILabel *displayNameLabel;
//@property (nonatomic, retain) UILabel *attackLabel;
//@property (nonatomic, retain) UILabel *defenseLabel;
//@property (nonatomic, retain) UILabel *magicArtsLabel;
//@property (nonatomic, retain) UILabel *difficultyLabel;
@property (nonatomic, retain) UILabel *goldCoinLabel;
@property (nonatomic, retain) UILabel *priceLabel;
@property (nonatomic, retain) UILabel *descriptionLabel;

@property (nonatomic, retain) HeroDetailModel *heroDetailModel;
*/

@end