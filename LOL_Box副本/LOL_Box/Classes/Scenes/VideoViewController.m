//
//  VideoViewController.m
//  LOL_Box
//
//  Created by lanou3g on 15/11/16.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import "VideoViewController.h"
#import "VideoCollectionReusableView.h"
#import "VideoFLModel.h"
#import "VideoImageCell.h"
#import "VideoTableViewController.h"

@interface VideoViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic,retain) UIScrollView *scorllView;
@property (nonatomic,retain) UIPageControl *page;
@property (nonatomic,retain) NSTimer *time;
@property (nonatomic, retain) UICollectionView *collectionView;

//外层数组用于承接网络解析对象
@property (nonatomic, retain) NSMutableArray *dataArray;
//用于计算数组中元素个数
@property (nonatomic, retain) NSArray *countArray;
//最外层大数组，用于承接所有对象
@property (nonatomic, retain) NSArray *array;
//字典，用于承接所有的subCategory
@property (nonatomic, retain) NSMutableDictionary *subDic;

@end

//cell重用标识符
static NSString *videoIdentifier = @"videoReuse";
//header重用标识符
static NSString *videoHeaderIdentifier = @"videoHeaderReuse";
static NSString *videoFooterIdentifier = @"videolFooterReuse";

@implementation VideoViewController

- (NSArray *)countArray{
    if (!_countArray) {
        _countArray = [NSArray new];
    }
    return _countArray;
}
- (NSArray *)array{
    if (!_array) {
        _array = [NSArray new];
    }
    return _array;
}
- (NSMutableDictionary *)subDic{
    if (!_subDic) {
        self.subDic = [NSMutableDictionary new];
    }
    return _subDic;
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
    }
    return _dataArray;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // 设置标题
        self.navigationItem.title = @"视频";
        // 设置tabBar
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"视频" image:[UIImage imageNamed:@"video"] tag:1000];
        
        //网络解析
        NSMutableURLRequest *videoRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:kVideoURL]];
        NSURLSession *videoSession = [NSURLSession sharedSession];
        NSURLSessionDataTask *task = [videoSession dataTaskWithRequest:videoRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
#warning ------ 文文打的
            //            if (error) {
            //                NSLog(@"%@",error);
            //            }
            self.array = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:&error];
            //取到单独的每个section的title,然后放在一个数组里面
            self.countArray = @[_array[0][@"name"], _array[1][@"name"], _array[2][@"name"], _array[3][@"name"], _array[4][@"name"]];
            for (NSDictionary *dict in _array) {
                    VideoFLModel *videoModel = [VideoFLModel new];
                    [videoModel setValuesForKeysWithDictionary:dict];
                    [self.dataArray addObject:videoModel];
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
    layout.minimumInteritemSpacing = 10;
    //设置最小列间距
    layout.minimumLineSpacing = 20;
    //设置item
    layout.itemSize = CGSizeMake(90, 90);
    //设置header区域的大小
    layout.headerReferenceSize = CGSizeMake(20, 40);
    //设置footer区域的大小
    layout.footerReferenceSize = CGSizeMake(100, 40);
    //设置item内边距的大小（顺序是上左下右）
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    //创建collectionView(在此之前必须先创建描述对象)
    //UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    self.collectionView = [[UICollectionView alloc] initWithFrame: CGRectMake(0, 260, 414, [UIScreen mainScreen].bounds.size.height - 260) collectionViewLayout:layout];
    //设置背景色(默认是黑色)
    _collectionView.backgroundColor = [UIColor whiteColor];
    //设置代理和数据源
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    //注册
    [_collectionView registerClass:[VideoImageCell class] forCellWithReuseIdentifier:videoIdentifier];
    //注册增补视图
    [_collectionView registerClass:[VideoCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:videoHeaderIdentifier];
    [_collectionView registerClass:[VideoCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:videoFooterIdentifier];
    //添加到视图上
    [self.view addSubview:_collectionView];
    
    // 自定义view并添加scroll
    UIView *view =[[UIView alloc] initWithFrame:CGRectMake(0, 64, 414, 250)];
    self.scorllView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 414, 250)];
    _scorllView.contentSize = CGSizeMake(414*5, 0);
    _scorllView.pagingEnabled = YES;
    view.backgroundColor = [UIColor whiteColor];
    
    [view addSubview:_scorllView];
    
    // 为scroll添加图片
    for (int i = 0; i < 5; i ++) {
        UIImageView * imgView = [[UIImageView alloc] initWithFrame:CGRectMake(414 * i, 0, 414, 250)];
        imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg", i + 1]];
        [_scorllView addSubview:imgView];
    }
    
    // 创建PageControl
    _page = [[UIPageControl alloc] initWithFrame:CGRectMake(250, 230, 150, 20)];
    _page.currentPageIndicatorTintColor = [UIColor redColor];
    _page.numberOfPages = 5;
    _page.currentPage = 0;
    _page.pageIndicatorTintColor = [UIColor lightGrayColor];
    [_page addTarget:self action:@selector(pageAction:) forControlEvents:UIControlEventValueChanged];
    [view addSubview:_page];
    [self.view addSubview:view];
    // 开启定时器
    _time = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timeAction:) userInfo:nil repeats:YES];
    
}

- (void)timeAction:(UIPageControl *)sender {
    static int i = 0;
    if (i > 3) {
        i = 0;
    } else {
        i++;
    }
    _scorllView.contentOffset = CGPointMake(414 * i, 0);
    _page.currentPage = i;
    
}

- (void)pageAction:(UIPageControl *)sender {
    NSInteger index = sender.currentPage;
    _scorllView.contentOffset = CGPointMake(414 * index, 0);
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x / 414;
    _page.currentPage = index;
}

#pragma mark --- collectionView dataSource

//设置分组个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return _countArray.count;
}

//设置每组item的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSArray *item = _array[section][@"subCategory"];
    return item.count;
}

//
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //从重用池里面取带有cellIdentifier标识符的cell
    VideoImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:videoIdentifier forIndexPath:indexPath];
    //设置contentView背景颜色
    cell.contentView.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:0.7];
    //设置contentView背景图片
    NSDictionary *diction = _array[indexPath.section][@"subCategory"][indexPath.row];
    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", diction[@"icon"]]]];
    //设置cell下面的文字
    cell.footerTitleLabel.text = diction[@"name"];
    return cell;
}

//返回增补视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    /*
//    VideoCollectionReusableView *headerReuseView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:videoHeaderIdentifier forIndexPath:indexPath];
//    //设置header的背景颜色
//    headerReuseView.backgroundColor = [UIColor whiteColor];
//    //设置header的title
//
//    if (indexPath.section == 0) {
////        NSLog(@"----------");
//        headerReuseView.headerTitleLabel.text = @"推荐视频";
//    } else if (indexPath.section == 1) {
//        headerReuseView.headerTitleLabel.text = @"解说视频";
//    } else if (indexPath.section == 2) {
//        headerReuseView.headerTitleLabel.text = @"搞笑视频";
//    } else if (indexPath.section == 3) {
//        headerReuseView.headerTitleLabel.text = @"综合视频";
//    } else {
//        headerReuseView.headerTitleLabel.text = @"英雄视频";
//    }
//    //返回增补视图
//    return headerReuseView;
    */
    if (kind == UICollectionElementKindSectionHeader) {
        VideoCollectionReusableView *headerReuseView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:videoHeaderIdentifier forIndexPath:indexPath];
        //设置header的背景颜色
        headerReuseView.backgroundColor = [UIColor whiteColor];
        //设置header的title
        headerReuseView.headerTitleLabel.text = _countArray[indexPath.section];
    /*
//        if (indexPath.section == 0) {
//            headerReuseView.headerTitleLabel.text = @"推荐视频";
//        } else if (indexPath.section == 1) {
//            headerReuseView.headerTitleLabel.text = @"解说视频";
//        } else if (indexPath.section == 2) {
//            headerReuseView.headerTitleLabel.text = @"搞笑视频";
//        } else if (indexPath.section == 3) {
//            headerReuseView.headerTitleLabel.text = @"综合视频";
//        } else {
//            headerReuseView.headerTitleLabel.text = @"英雄视频";
//        }
//        if (indexPath.section == 0) {
//            headerReuseView.headerTitleLabel.text = _countArray[indexPath.section];
//        } else if (indexPath.section == 1) {
//            headerReuseView.headerTitleLabel.text = _countArray[1];
//        } else if (indexPath.section == 2) {
//            headerReuseView.headerTitleLabel.text = _countArray[2];
//        } else if (indexPath.section == 3) {
//            headerReuseView.headerTitleLabel.text = _countArray[3];
//        } else {
//            headerReuseView.headerTitleLabel.text = _countArray[4];
//        }
   */
        //返回增补视图
        return headerReuseView;
    } else {
        VideoCollectionReusableView *footerReuseView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:videoFooterIdentifier forIndexPath:indexPath];
        return footerReuseView;
    }
    
    
}


//点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    VideoTableViewController *videoVC = [[VideoTableViewController alloc] init];
    NSDictionary *diction = _array[indexPath.section][@"subCategory"][indexPath.row];
    videoVC.string = diction[@"name"];
    [self.navigationController pushViewController:videoVC animated:YES];
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
