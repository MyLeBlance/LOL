//
//  NewsDetailViewController.m
//  LOL_Box
//
//  Created by lanou3g on 15/11/18.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import "NewsDetailViewController.h"
#import "ToolOfNewsModel.h"
#import "NewsToolCell.h"
#import "ToolDetailViewController.h"


@interface NewsDetailViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

//外层数组承接对象
@property (nonatomic, retain) NSMutableArray *dataArray;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, retain) NSArray *array;


@end

//cell重用标识符
static NSString *BKIdentifier = @"BKnewsReuse";

@implementation NewsDetailViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //标题
        self.navigationItem.title = @"道具";
        self.array = @[@"new", @"Tools", @"GoldPer", @"consumable", @"Vision", @"fumo", @"movement", @"mana_regen", @"mana", @"health_regen", @"health", @"critical_strike", @"spell_damage", @"armor", @"spell_block", @"damage", @"cooldown_reduction", @"life_steal", @"other", @"all"];
        
        //网络解析
        NSMutableURLRequest *freeHeroRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:kNewsURL]];
        NSURLSession *freeSession = [NSURLSession sharedSession];
        NSURLSessionDataTask *task = [freeSession dataTaskWithRequest:freeHeroRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            self.dataArray = [NSMutableArray arrayWithCapacity:5];
            NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:&error];
            
            for (NSDictionary *dict in array) {
                ToolOfNewsModel *toolModel = [ToolOfNewsModel new];
                [toolModel setValuesForKeysWithDictionary:dict];
                [_dataArray addObject:toolModel];
            }
            //返回主线程刷新数据
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.collectionView reloadData];
            });
        }];
        [task resume];
      
        
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    
    //创建布局对象
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //属性设置
    //设置最小行间距
    layout.minimumInteritemSpacing = 20;
    //设置最小列间距
    layout.minimumLineSpacing = 20;
    //设置item
    layout.itemSize = CGSizeMake(100, 100);
    //设置item内边距的大小（顺序是上左下右）
    layout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    //创建collectionView(在此之前必须先创建描述对象)
    self.collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    
    //设置背景色(默认是黑色)
    _collectionView.backgroundColor = [UIColor whiteColor];
    //设置代理和数据源
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    //注册
    [_collectionView registerClass:[NewsToolCell class] forCellWithReuseIdentifier:BKIdentifier];
    //添加到视图上
    [self.view addSubview:_collectionView];
    
}

#pragma mark --- collectionView dataSource

//设置分组个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

//设置每组item的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataArray.count;
}

//
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //从重用池里面取带有cellIdentifier标识符的cell
    NewsToolCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:BKIdentifier forIndexPath:indexPath];
    //设置contentView背景颜色
//    cell.contentView.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:0.7];
    cell.contentView.backgroundColor = [UIColor colorWithRed:87/255.0 green:138/255.0 blue:157/255.0 alpha:1];
    //设置contentView背景图片
    ToolOfNewsModel *tool = _dataArray[indexPath.row];
    cell.titleLabel.text = tool.text;
    return cell;
}

//点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
        ToolDetailViewController *toolVC = [[ToolDetailViewController alloc] init];
        toolVC.string = self.array[indexPath.row];
        NSLog(@"-------===%@",toolVC.string);
        [self.navigationController pushViewController:toolVC animated:YES];
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
