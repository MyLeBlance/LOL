//
//  BeautifulPhotoController.m
//  LOL_Box
//
//  Created by lanou3g on 15/11/23.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import "BeautifulPhotoController.h"
#import "BeautifulPhotoCollectionCell.h"
#import "PhotoViewController.h"

@interface BeautifulPhotoController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, retain) UICollectionView *collectionView;
// 最外层大字典
@property (nonatomic, retain) NSMutableDictionary *dataDictionary;
// 数组，用于接收cell的个数
@property (nonatomic, retain) NSMutableArray *dataArray;

@end

//cell重用标识符
static NSString *photoCellIdentifier = @"PhotoCell";
//header重用标识符
static NSString *photoHeaderIdentifier = @"headerReuse";
//footer重用标符
static NSString *photoFooterIdentifier = @"footerReuse";

@implementation BeautifulPhotoController

// 懒加载
- (NSMutableDictionary *)dataDcitionary{
    if (!_dataDictionary) {
        _dataDictionary = [NSMutableDictionary new];
    }
    return _dataDictionary;
}
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
    }
    return _dataArray;
}

// 数据解析
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if ([super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // 设置标题
        self.navigationItem.title = @"靓照";
        // 网络解析
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:kBeautifulPhotoURL]];
        NSURLSession *session = [NSURLSession sharedSession];
        __weak typeof(self)temp = self;
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            self.dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:&error];
            self.dataArray = _dataDictionary[@"data"];
            NSLog(@"=====%ld", self.dataArray.count);
        
            
            [temp.collectionView reloadData];
        }];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.collectionView reloadData];
//        });
        [task resume];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置
    
    //创建布局对象
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // 属性设置
    // 设置最小行间距
    layout.minimumInteritemSpacing = 10;
    // 设置最小列间距
    layout.minimumLineSpacing = 30;
    // 设置item
    layout.itemSize = CGSizeMake(180, 230);
    // 设置header区域的大小
    //layout.headerReferenceSize = CGSizeMake(20, 40);
    // 设置footer区域的大小
    //layout.footerReferenceSize = CGSizeMake(100, 40);
    // 设置item内边距的大小（顺序是上左下右）
    layout.sectionInset = UIEdgeInsetsMake(20, 15, 20, 15);
    
    // 创建collectionView(在此之前必须先创建描述对象)
    self.collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    // 设置背景色(默认是黑色)
    _collectionView.backgroundColor = [UIColor whiteColor];
    // 设置代理和数据源
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    // 注册
    [_collectionView registerClass:[BeautifulPhotoCollectionCell class] forCellWithReuseIdentifier:photoCellIdentifier];
    // 添加到视图上
    [self.view addSubview:_collectionView];
}

#pragma mark --- collectionView dataSource

// 设置分组个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    //    return _sectionArray.count;
    return 1;
}

// 设置每组item的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    NSLog(@"===============%ld", self.dataArray.count);
    return self.dataArray.count;
}

//
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    // 从重用池里面取带有cellIdentifier标识符的cell
    BeautifulPhotoCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:photoCellIdentifier forIndexPath:indexPath];
    
    // 设置contentView背景图片
//    NSString *str = _dataArray[indexPath.row][@"coverUrl"];
    NSDictionary *dic = _dataArray[indexPath.row];
    [cell.beautifulImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", dic[@"coverUrl"]]]];
    // 设置图片上面的标题
    cell.titleLabel.text = dic[@"title"];
    
    return cell;
}

// 点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoViewController *photoVC = [[PhotoViewController alloc] init];
    // 属性传值
    NSDictionary *dic = _dataArray[indexPath.row];
    photoVC.titleString = dic[@"title"];
    [self.navigationController pushViewController:photoVC animated:YES];
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
