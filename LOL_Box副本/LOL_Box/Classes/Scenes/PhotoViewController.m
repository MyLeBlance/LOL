//
//  PhotoViewController.m
//  LOL_Box
//
//  Created by lanou3g on 15/11/23.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import "PhotoViewController.h"
#import "PhotoCell.h"

@interface PhotoViewController ()

@property (nonatomic, retain) UICollectionView *collectionView;
// 最外层大数组
@property (nonatomic, retain) NSMutableDictionary *dataDictionary;
// 数组，用于接收cell的个数
@property (nonatomic, retain) NSMutableArray *dataArray;
@property (nonatomic, retain) UIWebView *webView;

@end

// 重用标志符
//static NSString *pohotIdentifier = @"beautifulCell";

@implementation PhotoViewController

// 懒加载
- (NSMutableDictionary *)dataDictionary{
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
        // 网络解析
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:kBeautifulPhotoURL]];
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            self.dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:&error];
            self.dataArray = _dataDictionary[@"data"];
            NSLog(@"=+=+=+=+=%ld", self.dataArray.count);
        }];
        [task resume];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    // 设置标题
    self.navigationItem.title = _titleString;
    /*
    //创建布局对象
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // 属性设置
    // 设置最小行间距
    layout.minimumInteritemSpacing = 10;
    // 设置最小列间距
    layout.minimumLineSpacing = 30;
    // 设置item
    layout.itemSize = CGSizeMake(394, 624);
    // 设置item内边距的大小（顺序是上左下右）
    layout.sectionInset = UIEdgeInsetsMake(20, 10, 20, 10);
    
    // 创建collectionView(在此之前必须先创建描述对象)
    self.collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    // 设置背景色(默认是黑色)
    _collectionView.backgroundColor = [UIColor whiteColor];
    // 设置代理和数据源
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    // 注册
    [_collectionView registerClass:[PhotoCell class] forCellWithReuseIdentifier:pohotIdentifier];
    // 添加到视图上
    [self.view addSubview:_collectionView];
    */
    
    self.webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://s1.dwstatic.com/group1/M00/72/F9/f379d12539db076b7cf9b3328a3c4be5.jpg"]]];
    [self.webView loadRequest:request];
    [self.view addSubview:_webView];
}
/*
#pragma mark --- collectionView dataSource

// 设置分组个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    //    return _sectionArray.count;
    return 1;
}

// 设置每组item的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    //    NSLog(@"===============%ld", self.dataArray.count);
    return 9;
}

//
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    // 从重用池里面取带有cellIdentifier标识符的cell
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:pohotIdentifier forIndexPath:indexPath];
    
    // 设置contentView背景图片
//    NSString *str = _dataArray[indexPath.row][@"destUrl"];
    NSDictionary *dic = _dataArray[indexPath.row];
    [cell.beautifulImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", dic[@"destUrl"]]]];
    
    return cell;
}
*/

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
