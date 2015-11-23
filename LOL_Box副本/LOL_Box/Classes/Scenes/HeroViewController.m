//
//  HeroViewController.m
//  LOL_Box
//
//  Created by lanou3g on 15/11/16.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import "HeroViewController.h"
#import "HeroCollectionReusableView.h"
#import "HeroImageCell.h"
#import "UIImageView+WebCache.h"
#import "FreeHeroModel.h"
#import "AllHeroModel.h"
#import "HeroDetailTableViewController.h"

@interface HeroViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

//创建外层数组用于盛放周免英雄
@property (nonatomic, retain) NSMutableArray *freeHeroPerWeak;
//创建外层数组用于盛放全部英雄
@property (nonatomic, retain) NSMutableArray *allHear;

@property (nonatomic, strong) NSMutableDictionary *dataDict;

@property (nonatomic, strong) NSArray *sectionArray;

@property (nonatomic, retain) UICollectionView *collectionView;
@end

//cell重用标识符
static NSString *cellIdentifier = @"cellReuse";
//header重用标识符
static NSString *headerIdentifier = @"headerReuse";
//footer重用标符
static NSString *footerIdentifier = @"footerReuse";

@implementation HeroViewController

//懒加载
//- (NSMutableArray *)freeHeroPerWeak{
//    if (!_freeHeroPerWeak) {
//        _freeHeroPerWeak = [NSMutableArray arrayWithCapacity:20];
//    }
//    return _freeHeroPerWeak;
//}
//
//- (NSMutableArray *)allHear{
//    if (!_allHear) {
//        _allHear = [NSMutableArray arrayWithCapacity:20];
//    }
//    return _allHear;
//}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //设置标题
        self.navigationItem.title = @"英雄";
        //设置tabBar
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"英雄" image:[UIImage imageNamed:@"hero"] tag:1000];
        
        //网络解析
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
            dispatch_async(dispatch_get_main_queue(), ^{
                //                [self.dataDict setObject:_freeHeroPerWeak forKey:@"周免英雄"];
                //                self.myBlock();
                [self allHero];
            });
            
            
        }];
        [freeTask resume];
        
    }
    return self;
}

- (void)allHero{
    //全部英雄
    NSMutableURLRequest *allHeroRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:kAllHeroURL]];
    NSURLSession *allSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *allTask = [allSession dataTaskWithRequest:allHeroRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *allDic1 = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:&error];
        NSArray *allArray1 = allDic1[@"all"];
        for (NSDictionary *allDic2 in allArray1) {
            AllHeroModel *allModel1 = [AllHeroModel new];
            [allModel1 setValuesForKeysWithDictionary:allDic2];
            [_allHear addObject:allModel1];
            //                NSLog(@"%@", _allHear);
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            //                [self.dataDict setObject:_allHear forKey:@"全部英雄"];
            //                self.myBlock();
            [self.collectionView reloadData];
        });
    }];
    [allTask resume];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置背景颜色
    self.view.backgroundColor = [UIColor lightGrayColor];
//    self.dataDict = [NSMutableDictionary dictionary];
//    self.sectionArray = @[@"周免英雄",@"全部英雄"];
    
    // 设置导航图的背景图片
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"lol.jpg"] forBarMetrics:UIBarMetricsDefault];

    //创建布局对象
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //属性设置
        //设置最小行间距
        layout.minimumInteritemSpacing = 10;
        //设置最小列间距
        layout.minimumLineSpacing = 30;
        //设置item
        layout.itemSize = CGSizeMake(90, 90);
        //设置header区域的大小
        layout.headerReferenceSize = CGSizeMake(20, 40);
        //设置footer区域的大小
        layout.footerReferenceSize = CGSizeMake(100, 40);
        //设置item内边距的大小（顺序是上左下右）
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    
    //创建collectionView(在此之前必须先创建描述对象)
    self.collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
        //设置背景色(默认是黑色)
        _collectionView.backgroundColor = [UIColor whiteColor];
        //设置代理和数据源
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        //注册
        [_collectionView registerClass:[HeroImageCell class] forCellWithReuseIdentifier:cellIdentifier];
        //注册增补视图
        [_collectionView registerClass:[HeroCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentifier];
        [_collectionView registerClass:[HeroCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerIdentifier];
    //添加到视图上
    [self.view addSubview:_collectionView];
    
    //刷新页面
//    self.myBlock = ^(){
//        [collectionView reloadData];
//    };
    
    
}

#pragma mark --- collectionView dataSource

//设置分组个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
//    return _sectionArray.count;
    return 2;
}

//设置每组item的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    NSArray *array = _dataDict[_sectionArray[section]];
//    return array.count;
    if (section == 0) {
        return _freeHeroPerWeak.count;
    } else {
        return _allHear.count;
    }
}

//
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //从重用池里面取带有cellIdentifier标识符的cell
    HeroImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    //设置contentView背景颜色
    cell.contentView.backgroundColor = [UIColor brownColor];
    //设置contentView背景图片
    
//    cell.titleLabel.text = _freeHeroPerWeak[indexPath.row];
//    cell.cnNameLabel.text = _freeHeroPerWeak[indexPath.row];
    
    if (indexPath.section == 0) {
            FreeHeroModel *free = _freeHeroPerWeak[indexPath.row];
            [cell.heroImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", free.enName]]];
        cell.titleLabel.text = free.title;
    } else {
            AllHeroModel *free1 = _allHear[indexPath.row];
            [cell.heroImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", free1.enName]]];
            cell.titleLabel.text = free1.title;
    }
    return cell;
}

//返回增补视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (kind == UICollectionElementKindSectionHeader){
        HeroCollectionReusableView *headerReuseView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerIdentifier forIndexPath:indexPath];
        //设置header的背景颜色
        headerReuseView.backgroundColor = [UIColor whiteColor];
        //设置header的title
        if (indexPath.section == 0) {
            headerReuseView.titleLabel.text = @"周免英雄";
        } else {
            headerReuseView.titleLabel.text = @"全部英雄";
        }
        //返回增补视图
        return headerReuseView;
    } else {
        HeroCollectionReusableView *footerReuseView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:footerIdentifier forIndexPath:indexPath];
        return footerReuseView;
    }
}

//点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    HeroDetailTableViewController *heroDetailVC = [[HeroDetailTableViewController alloc] init];
    // 属性传值
    if (indexPath.section == 0) {
        FreeHeroModel *free = _freeHeroPerWeak[indexPath.row];
        heroDetailVC.displayerNameString = free.title;
    } else {
        AllHeroModel *free1 = _allHear[indexPath.row];
        heroDetailVC.displayerNameString = free1.title;
    }
    [self.navigationController pushViewController:heroDetailVC animated:YES];
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
