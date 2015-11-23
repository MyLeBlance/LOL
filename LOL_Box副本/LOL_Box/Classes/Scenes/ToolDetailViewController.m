//
//  ToolDetailViewController.m
//  LOL_Box
//
//  Created by lanou3g on 15/11/18.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import "ToolDetailViewController.h"
#import "ToolDetail.h"
#import "ToolCell.h"
#import "UIImageView+WebCache.h"

@interface ToolDetailViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, retain) NSMutableArray *dataArray;
@property (nonatomic, retain) UICollectionView *collectionView;

@end

//cell重用标识符
static NSString *toolIdentifier = @"toolNewsReuse";

@implementation ToolDetailViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //设置标题
        self.navigationItem.title = @"工具装备";
        
//        NSString *string = [NSString stringWithFormat:@"http://lolbox.duowan.com/phone/apiZBItemList.php?tag=%@&v=108&OSType=iOS8.3&versionName=2.2.",_string];
//        NSLog(@"+++++++++%@",string);
//        //网络解析
//        NSMutableURLRequest *freeHeroRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:string]];
//        NSURLSession *freeSession = [NSURLSession sharedSession];
//        NSURLSessionDataTask *task = [freeSession dataTaskWithRequest:freeHeroRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//            self.dataArray = [NSMutableArray arrayWithCapacity:5];
//            NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:&error];
//            
//            for (NSDictionary *dict in array) {
//                ToolDetail *toolModel = [ToolDetail new];
//                [toolModel setValuesForKeysWithDictionary:dict];
//                [_dataArray addObject:toolModel];
//            }
//            //返回主线程刷新数据
//            dispatch_async(dispatch_get_main_queue(), ^{
//                [self.collectionView reloadData];
//            });
//        }];
//        [task resume];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *string = [NSString stringWithFormat:@"http://lolbox.duowan.com/phone/apiZBItemList.php?tag=%@&v=108&OSType=iOS8.3&versionName=2.2.",_string];
    NSLog(@"+++++++++%@",string);
    
    //网络解析
    NSMutableURLRequest *freeHeroRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:string]];
    NSURLSession *freeSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [freeSession dataTaskWithRequest:freeHeroRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        self.dataArray = [NSMutableArray arrayWithCapacity:5];
        NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:&error];
        
        for (NSDictionary *dict in array) {
            ToolDetail *toolModel = [ToolDetail new];
            [toolModel setValuesForKeysWithDictionary:dict];
            [_dataArray addObject:toolModel];
        }
        //返回主线程刷新数据
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });
    }];
    [task resume];
    //设置背景颜色
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    //创建布局对象
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //属性设置
    //设置最小行间距
    layout.minimumInteritemSpacing = 20;
    //设置最小列间距
    layout.minimumLineSpacing = 20;
    //设置item
    layout.itemSize = CGSizeMake(75, 75);
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
    [_collectionView registerClass:[ToolCell class] forCellWithReuseIdentifier:toolIdentifier];
    //添加到视图上
    [self.view addSubview:_collectionView];
    
}

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
    ToolCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:toolIdentifier forIndexPath:indexPath];
    //设置contentView背景颜色
    cell.contentView.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:0.7];
    //设置contentView的标题
    ToolDetail *tool = _dataArray[indexPath.row];
    cell.titleLabel.text = tool.text;
    //加载装备图片
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%d_64x64.png", tool.ID]]];
    
    return cell;
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
