//
//  HeroDetailViewController.m
//  LOL_Box
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import "HeroDetailViewController.h"
#import "FreeHeroModel.h"
#import "AllHeroModel.h"
#import "UIImageView+WebCache.h"

@interface HeroDetailViewController ()

//创建外层数组用于盛放周免英雄
@property (nonatomic, retain) NSMutableArray *freeHeroPerWeak;
//创建外层数组用于盛放全部英雄
@property (nonatomic, retain) NSMutableArray *allHear;

@end

@implementation HeroDetailViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //标题
        self.navigationItem.title = @"英雄详情";
        
        //网络数据解析
        //周免英雄
        NSMutableURLRequest *freeHeroRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:kFreeHeroURL]];
        NSURLSession *freeSession = [NSURLSession sharedSession];
        NSURLSessionDataTask *freeTask = [freeSession dataTaskWithRequest:freeHeroRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            self.freeHeroPerWeak = [NSMutableArray array];
            self.allHear = [NSMutableArray array];
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:&error];
            NSArray *array = dic[@"free"];
            for (NSDictionary *dict in array) {
                FreeHeroModel *freeModel = [FreeHeroModel new];
                [freeModel setValuesForKeysWithDictionary:dict];
                [_freeHeroPerWeak addObject:freeModel];
                //                NSLog(@"%@", _freeHeroPerWeak);
            }
//            dispatch_async(dispatch_get_main_queue(), ^{
//                //                [self.dataDict setObject:_freeHeroPerWeak forKey:@"周免英雄"];
//                [self.view reloadInputViews];
//            });
            
            
        }];
        [freeTask resume];

        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    
    //导航条透明度
    self.navigationController.navigationBar.translucent = NO;
    
//    整个英雄详情页面
    UIScrollView *bigScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 414, 623)];
    bigScrollView.contentSize = CGSizeMake(414 * 5, 623);
    //设置是否整页滚动
    bigScrollView.pagingEnabled = YES;
    //设置与页面滚动相对应的滚动条是否显示
    bigScrollView.showsHorizontalScrollIndicator = NO;
    //scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:bigScrollView];
    
//    英雄详情的第一个页面：资料和英雄背景
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 414, 623)];
    scrollView.contentSize = CGSizeMake(414, 623 * 2);
    [bigScrollView addSubview:scrollView];
    //资料两个字
    UILabel *introduceLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 394, 30)];
    introduceLabel.text = @"资料";
    introduceLabel.font = [UIFont systemFontOfSize:20];
    [scrollView addSubview:introduceLabel];
    
    //图片
    self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 50, 200, 241)];
    _imgView.backgroundColor = [UIColor redColor];
    
//    FreeHeroModel *free = [FreeHeroModel new];
//    NSArray *nameArray = @[@"Sona", @"MissFortune", @"Kindred", @"Tristana", @"Katarina", @"Elise", @"Singed", @"Anivia", @"Yorick", @"Jayce", @"Ashe", @"Garen", @"Ryze"];
//    for (int i = 0; i < 13; i++) {
        [_imgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/Yasuo_120x120.jpg"]]];
//    }

    [scrollView addSubview:_imgView];
    
    //图片右边的Label
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(220, 59, 184, 20)];
    _titleLabel.text = @"亚索";
    _titleLabel.font = [UIFont systemFontOfSize:20];
    [scrollView addSubview:_titleLabel];

    self.displayNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(220, 88, 184, 20)];
    _displayNameLabel.text = @"疾风剑豪";
    [scrollView addSubview:_displayNameLabel];
    
    self.attackLabel = [[UILabel alloc] initWithFrame:CGRectMake(220, 117, 184, 20)];
    _attackLabel.text = @"攻击";
    [scrollView addSubview:_attackLabel];
    
    self.defenseLabel = [[UILabel alloc] initWithFrame:CGRectMake(220, 146, 184, 20)];
    _defenseLabel.text = @"法术";
    [scrollView addSubview:_defenseLabel];
    
    self.magicArtsLabel = [[UILabel alloc] initWithFrame:CGRectMake(220, 175, 184, 20)];
    _magicArtsLabel.text = @"防御";
    [scrollView addSubview:_magicArtsLabel];
    
    self.difficultyLabel = [[UILabel alloc] initWithFrame:CGRectMake(220, 204, 184, 20)];
    _difficultyLabel.text = @"难度";
    [scrollView addSubview:_difficultyLabel];
    
    self.goldCoinLabel = [[UILabel alloc] initWithFrame:CGRectMake(220, 233, 184, 20)];
    _goldCoinLabel.text = @"金币  6300";
    [scrollView addSubview:_goldCoinLabel];
    
    self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(220, 262, 184, 20)];
    _priceLabel.text = @"点券  4500";
    [scrollView addSubview:_priceLabel];
    
    //英雄背景
    UILabel *backgroundLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 301, 394, 30)];
    backgroundLabel.text = @"英雄背景";
    backgroundLabel.font = [UIFont systemFontOfSize:20];
    [scrollView addSubview:backgroundLabel];
    //背景内容
    self.DescriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 341, 394, 900)];
    _DescriptionLabel.text = @"    亚索是一个百折不屈的男人，还是一名身手敏捷的剑客，能够运用风的力量来斩杀敌人。这位曾经春风得意的战士因为诬告而身败名裂，并且被迫卷入了一场令人绝望的生存之战。即使整个世界都已与他为敌，他也要竭尽所能地去将罪恶绳之以法，并恢复自身的名誉。\n    亚索曾是艾欧尼亚某所知名剑术道场的天才学徒，并且还是同辈中唯一能够掌握传说中的御风剑术的学生。大部分人曾相信他注定会成为一位伟大的英雄。但是，因为诺克萨斯的入侵，他的命运被永久地改变了。亚索在那时负责保护一位艾欧尼亚长者，但是，他自大地以为自己的剑能够改变战局，便擅离职守，投身于战场之中。当他回到长者身边时，发现长者已被杀死。\n    身败名裂的亚索甘愿自首，准备用一生来补偿他的失职之罪。但是，他不单被控告玩忽职守，还被控告谋杀，这让他震惊不已。尽管负罪感让他困惑不已、痛苦不堪，但他知道，如果他不作为的话，真正的刺客就会逍遥法外。亚索拔剑而战，逃出道场，并且他非常清楚，自己又犯下了谋反罪，整个艾欧尼亚都会与他为敌了。他第一次陷入真正的孤独境地，踏上了寻找杀害长老的真凶的人生旅程。\n    亚索接下来的数年都在各地流浪，搜寻着能够带他找到真凶的蛛丝马迹。至始至终，他都在被昔日的同窗们无情地追捕着，不断地被迫作战，否则就会丧命。他的使命驱使着他不断前行，直到他被最为可怕的对手——他的亲兄弟，永恩——所追上。\n    在传统礼教的束缚下，这两位剑客先是互相鞠躬，然后拔剑交战。在月光下，他们无声地将剑挥舞了一圈又一圈。当他们最终向前冲锋时，永恩不敌亚索；剑光闪过，永恩就倒下了。亚索弃剑后冲到永恩旁边。\n    百感交集下，他询问自己的兄弟，他的亲人们怎么会认为他有罪。永恩说：“长者死于御风剑术。还有谁能做到呢？”亚索瞬间明白了为何自己会被控告。他再次声称自己是清白的，并且乞求他的兄弟原谅自己。随着他的兄弟在他的臂弯里永眠，他的泪水也在他的脸颊上滑落。\n    在旭日下，亚索埋葬了永恩，但他没有时间去悼念了。很快就会有其他人来追捕他。兄弟的启示给了他全新的目标；他现在已经有了能够带他抓到真凶的线索。他一边立誓，一边收拾行李，不舍地告别永恩之墓，在风的陪伴下踏上征程。\n    “剑之故事，以血为墨。”——亚索";
    _DescriptionLabel.numberOfLines = 0;
    [scrollView addSubview:_DescriptionLabel];
    
    
//    英雄详情的第二个页面：技能
    UIScrollView *scrollView1 = [[UIScrollView alloc] initWithFrame:CGRectMake(414, 0, 414, 623)];
    scrollView1.contentSize = CGSizeMake(414, 623 * 2);
    [bigScrollView addSubview:scrollView1];
    //技能两个字
    UILabel *skillLAabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 394, 30)];
    skillLAabel.text = @"技能";
    skillLAabel.font = [UIFont systemFontOfSize:20];
    [scrollView1 addSubview:skillLAabel];
    
    UILabel *QLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 394, 770)];
    QLabel.text = @"被动技能:浪客之道\n    亚索的暴击几率翻倍。此外，亚索会在移动时积攒一层护盾。护盾会在他受到来自英雄或野怪的伤害时触发，护盾值: 100 - 510。剑意值充能比率: 78/89/100% 效果 (在等级1/7/13时变化)\n\nQ技能：\n    一次无目标锁定的普通攻击。在两次成功的斩钢闪后，第三次斩钢闪将会形成一道击飞敌人的旋风。在命中时，斩钢闪会获得一层旋风烈斩效果，持续10秒。在积攒2层旋风烈斩效果后，斩钢闪会形成一阵能够击飞敌人的旋风。斩钢闪被视为普通攻击：它可以暴击，附带攻击特效，并且它的冷却时间和施法时间都会从攻击速度上获得收益。如果在突进的过程中施放斩钢闪，那么斩钢闪就会呈环状出剑。\n\nW技能：\n    形成一个气流之墙，来阻挡敌方的飞行道具。形成一个气流之墙，可以阻挡敌方的所有飞行道具，持续4秒。\n\nE技能：\n    突进到一个单位身边，造成逐步提升的魔法伤害。向目标敌人突进，造成70/90/110/130/150 (+0.6)魔法伤害。每次施法都会使你的下一次突进的基础伤害提升25%，最多提升至50/50/50/50/50%。在10/9/8/7/6秒内无法对相同敌人重复施放。\n\nR技能：\n    突进到一个单位身边，并对该单位进行多次击打，造成重度伤害。只能对被击飞的单位施放。闪烁到一个被击飞的敌方英雄身边，造成200/300/400(+)物理伤害，并使范围内的所有被击飞的敌人在空中多停留1秒。获得满额的剑意值，并重置斩钢闪的旋风烈斩层数。在接下来的15秒里，亚索会获得50/50/50%的护甲穿透加成——这个效果能够无视目标的来自装备、增益、符文和天赋的护甲值。";
    QLabel.numberOfLines = 0;
    [scrollView1 addSubview:QLabel];
    
//    英雄详情的第三个页面：皮肤
    UIScrollView *scrollView2 = [[UIScrollView alloc] initWithFrame:CGRectMake(828, 0, 414, 623)];
    scrollView2.contentSize = CGSizeMake(414, 623 * 2);
    scrollView2.backgroundColor = [UIColor brownColor];
    [bigScrollView addSubview:scrollView2];
    
    
    
}

- (void)setHeroDetailView:(HeroDetailView *)heroDetailView{
//    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(220, 59, 184, 20)];
//    self.heroDetailView = [HeroDetailView new];
//    FreeHeroModel *free = _freeHeroPerWeak;
    _titleLabel.text = _heroDetailView.title;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
