//
//  HeroDetailCell.m
//  LOL_Box
//
//  Created by lanou3g on 15/11/20.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import "HeroDetailCell.h"

@implementation HeroDetailCell
/*
- (instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        
        //图片
        self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 50, 200, 241)];
        _imgView.backgroundColor = [UIColor redColor];
        
        [self addSubview:_imgView];
        
        //图片右边的Label
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(220, 59, 184, 20)];
        //        _titleLabel.text = @"亚索";
        _titleLabel.font = [UIFont systemFontOfSize:20];
        [self addSubview:_titleLabel];
        
        self.displayNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(220, 88, 184, 20)];
        //        _displayNameLabel.text = @"疾风剑豪";
        [self addSubview:_displayNameLabel];
        
        self.goldCoinLabel = [[UILabel alloc] initWithFrame:CGRectMake(220, 233, 184, 20)];
        //        _goldCoinLabel.text = @"金币  6300";
        [self addSubview:_goldCoinLabel];
        
        self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(220, 262, 184, 20)];
        //        _priceLabel.text = @"点券  4500";
        [self addSubview:_priceLabel];
        
        //英雄背景
        UILabel *backgroundLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 301, 394, 30)];
        //        backgroundLabel.text = @"英雄背景";
        backgroundLabel.font = [UIFont systemFontOfSize:20];
        [self addSubview:backgroundLabel];
        //背景内容
        self.descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 341, 394, 900)];
        //_descriptionLabel.text = @"    亚索是一个百折不屈的男人，还是一名身手敏捷的剑客，能够运用风的力量来斩杀敌人。这位曾经春风得意的战士因为诬告而身败名裂，并且被迫卷入了一场令人绝望的生存之战。即使整个世界都已与他为敌，他也要竭尽所能地去将罪恶绳之以法，并恢复自身的名誉。\n    亚索曾是艾欧尼亚某所知名剑术道场的天才学徒，并且还是同辈中唯一能够掌握传说中的御风剑术的学生。大部分人曾相信他注定会成为一位伟大的英雄。但是，因为诺克萨斯的入侵，他的命运被永久地改变了。亚索在那时负责保护一位艾欧尼亚长者，但是，他自大地以为自己的剑能够改变战局，便擅离职守，投身于战场之中。当他回到长者身边时，发现长者已被杀死。\n    身败名裂的亚索甘愿自首，准备用一生来补偿他的失职之罪。但是，他不单被控告玩忽职守，还被控告谋杀，这让他震惊不已。尽管负罪感让他困惑不已、痛苦不堪，但他知道，如果他不作为的话，真正的刺客就会逍遥法外。亚索拔剑而战，逃出道场，并且他非常清楚，自己又犯下了谋反罪，整个艾欧尼亚都会与他为敌了。他第一次陷入真正的孤独境地，踏上了寻找杀害长老的真凶的人生旅程。\n    亚索接下来的数年都在各地流浪，搜寻着能够带他找到真凶的蛛丝马迹。至始至终，他都在被昔日的同窗们无情地追捕着，不断地被迫作战，否则就会丧命。他的使命驱使着他不断前行，直到他被最为可怕的对手——他的亲兄弟，永恩——所追上。\n    在传统礼教的束缚下，这两位剑客先是互相鞠躬，然后拔剑交战。在月光下，他们无声地将剑挥舞了一圈又一圈。当他们最终向前冲锋时，永恩不敌亚索；剑光闪过，永恩就倒下了。亚索弃剑后冲到永恩旁边。\n    百感交集下，他询问自己的兄弟，他的亲人们怎么会认为他有罪。永恩说：“长者死于御风剑术。还有谁能做到呢？”亚索瞬间明白了为何自己会被控告。他再次声称自己是清白的，并且乞求他的兄弟原谅自己。随着他的兄弟在他的臂弯里永眠，他的泪水也在他的脸颊上滑落。\n    在旭日下，亚索埋葬了永恩，但他没有时间去悼念了。很快就会有其他人来追捕他。兄弟的启示给了他全新的目标；他现在已经有了能够带他抓到真凶的线索。他一边立誓，一边收拾行李，不舍地告别永恩之墓，在风的陪伴下踏上征程。\n    “剑之故事，以血为墨。”——亚索";
        _descriptionLabel.numberOfLines = 0;
        [self addSubview:_descriptionLabel];
        
    }
    return self;
}
*/

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
