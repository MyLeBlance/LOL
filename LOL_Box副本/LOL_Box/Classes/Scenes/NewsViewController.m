//
//  NewsViewController.m
//  LOL_Box
//
//  Created by lanou3g on 15/11/16.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsCollectionReusableView.h"
#import "NewsCollectionViewCell.h"
#import "NewsDetailViewController.h"
#import "VideoFLModel.h"
#import "RunesTableViewController.h"
#import "BestGroupViewController.h"
#import "HeaderlineTableViewController.h"
#import "NewsVideoController.h"
#import "GameTableViewController.h"
#import "BeautifulPhotoController.h"


@interface NewsViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, retain) UICollectionView *collectionView;

@end

//cell重用标识符
static NSString *newsIdentifier = @"newsReuse";
//header重用标识符
static NSString *newsHeaderIdentifier = @"headerReuse";

@implementation NewsViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // 设置标题
        self.navigationItem.title = @"资讯";
        // 设置tabBar
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"资讯" image:[UIImage imageNamed:@"news"] tag:1000];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    
    
    //创建布局对象
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //属性设置
    //设置最小行间距
    layout.minimumInteritemSpacing = 20;
    //设置最小列间距
    layout.minimumLineSpacing = 20;
    //设置item
    layout.itemSize = CGSizeMake(120, 120);
    //设置header区域的大小
    layout.headerReferenceSize = CGSizeMake(20, 40);
    //设置item内边距的大小（顺序是上左下右）
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    //创建collectionView(在此之前必须先创建描述对象)
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    
    //设置背景色(默认是黑色)
    collectionView.backgroundColor = [UIColor whiteColor];
    //设置代理和数据源
    collectionView.dataSource = self;
    collectionView.delegate = self;
    //注册
    [collectionView registerClass:[NewsCollectionViewCell class] forCellWithReuseIdentifier:newsIdentifier];
    //注册增补视图
    [collectionView registerClass:[NewsCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:newsHeaderIdentifier];
    //添加到视图上
    [self.view addSubview:collectionView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --- collectionView dataSource

//设置分组个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

//设置每组item的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 12;
}

//
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //从重用池里面取带有cellIdentifier标识符的cell
    NewsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:newsIdentifier forIndexPath:indexPath];
    //设置contentView背景颜色
    cell.contentView.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:0.7];
    //设置contentView背景图片
    NSArray *array = @[@"头条", @"视频", @"赛事", @"靓照", @"囧图", @"壁纸", @"道具", @"符文", @"天赋", @"最佳阵容", @"召唤师技能", @"盒子新闻"];
    for (int i = 0; i < 12; i++) {
        if (indexPath.row == i) {
            cell.titleLabel.text = array[i];
        }
    }
    return cell;
}

//返回增补视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    NewsCollectionReusableView *headerReuseView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:newsHeaderIdentifier forIndexPath:indexPath];
    //设置header的背景颜色
    headerReuseView.backgroundColor = [UIColor whiteColor];
    //设置header的title
    headerReuseView.titleLabel.text = @"百科";
    headerReuseView.titleLabel.font = [UIFont systemFontOfSize:20];
    //返回增补视图
    return headerReuseView;
}

//点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row == 7) {
        RunesTableViewController *runesVC = [[RunesTableViewController alloc] init];
        [self.navigationController pushViewController:runesVC animated:YES];
    } else if (indexPath.row == 9) {
        BestGroupViewController *bestVC = [[BestGroupViewController alloc] init];
        [self.navigationController pushViewController:bestVC animated:YES];
    } else if (indexPath.row == 0) {
        HeaderlineTableViewController *headerlineVC = [[HeaderlineTableViewController alloc] init];
        [self.navigationController pushViewController:headerlineVC animated:YES];
    } else if (indexPath.row == 1) {
        NewsVideoController *newsVideoVC = [[NewsVideoController alloc] init];
        [self.navigationController pushViewController:newsVideoVC animated:YES];
    } else if (indexPath.row == 2) {
        GameTableViewController *gameVC = [[GameTableViewController alloc] init];
        [self.navigationController pushViewController:gameVC animated:YES];
    } else if (indexPath.row == 3) {
        BeautifulPhotoController *beautifulVC = [[BeautifulPhotoController alloc] init];
        [self.navigationController pushViewController:beautifulVC animated:YES];
    }
    else {
    NewsDetailViewController *detailVC = [[NewsDetailViewController alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
    }
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
