//
//  GameTableViewCell.h
//  LOL_Box
//
//  Created by lanou3g on 15/11/23.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *gameLabel;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *contentLabel;

@end
