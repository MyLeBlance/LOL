//
//  BestGroupViewController.m
//  LOL_Box
//
//  Created by lanou3g on 15/11/19.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import "BestGroupViewController.h"
#import "BestGroupCollectionReusableView.h"
#import "BestGroup.h"
#import "BestGroupCell.h"
#import "BestGroupDetailController.h"


@interface BestGroupViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

//最外层数组
@property (nonatomic, retain) NSMutableArray *dataArray;
@property (nonatomic, retain) UICollectionView *collectionView;

@property (nonatomic, retain) BestGroup *bestGroupModel;

@end

//cell重用标识符
static NSString *bestIdentifier = @"bestReuse";
//header重用标识符
static NSString *bestHeaderIdentifier = @"bestHeaderReuse";
static NSString *bestFooterIdentifier = @"footerFooterReuse";

@implementation BestGroupViewController


- (BestGroup *)bestGroupModel{
    if (!_bestGroupModel) {
        _bestGroupModel = [BestGroup new];
    }
    return _bestGroupModel;
}

#warning notitioning --- 执行顺序可能不对，偶尔会不显示

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        //设置标题
        self.navigationItem.title = @"最佳阵容";
        
        //网络解析
        NSMutableURLRequest *bestGroupRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:kBestGroup]];
        NSURLSession *bestGroupSession = [NSURLSession sharedSession];
        NSURLSessionDataTask *bestGroupTask = [bestGroupSession dataTaskWithRequest:bestGroupRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:&error];
            
            for (NSDictionary *dict in array) {
                self.bestGroupModel = [BestGroup new];
                [_bestGroupModel setValuesForKeysWithDictionary:dict];
                [self.dataArray addObject:_bestGroupModel];
                NSLog(@"++++%@", _bestGroupModel.title);
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.collectionView reloadData];
            });
        }];
        [bestGroupTask resume];
    }
    return self;
}

//懒加载
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        self.dataArray = [NSMutableArray new];
    }
    return _dataArray;
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
    layout.minimumLineSpacing = 30;
    //设置item
    layout.itemSize = CGSizeMake(70, 70);
    //设置header区域的大小
    layout.headerReferenceSize = CGSizeMake(20, 40);
    // 设置footer区域的大小
    layout.footerReferenceSize = CGSizeMake(100, 40);
    //设置item内边距的大小（顺序是上左下右）
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 10, 5);
    
    //创建collectionView(在此之前必须先创建描述对象)
    self.collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    //设置背景色(默认是黑色)
    _collectionView.backgroundColor = [UIColor whiteColor];
    //设置代理和数据源
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    //注册
    [_collectionView registerClass:[BestGroupCell class] forCellWithReuseIdentifier:bestIdentifier];
    //注册增补视图
    [_collectionView registerClass:[BestGroupCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:bestHeaderIdentifier];
    // footer
    [_collectionView registerClass:[BestGroupCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:bestFooterIdentifier];
    //添加到视图上
    [self.view addSubview:_collectionView];
    
}

#pragma mark --- collectionView dataSource

//设置分组个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return _dataArray.count;
}

//设置每组item的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}

//
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //从重用池里面取带有cellIdentifier标识符的cell
    BestGroupCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:bestIdentifier forIndexPath:indexPath];
    //设置contentView背景颜色
    cell.contentView.backgroundColor = [UIColor brownColor];
    //设置contentView背景图片
    self.bestGroupModel = _dataArray[indexPath.section];
    
    NSArray *array = @[_bestGroupModel.hero1, _bestGroupModel.hero2, _bestGroupModel.hero3, _bestGroupModel.hero4, _bestGroupModel.hero5];
    if (indexPath.row == 0) {
        [cell.bestGroupImgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", array[0]]]];
    } else if (indexPath.row == 1) {
        [cell.bestGroupImgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", array[1]]]];
    } else if (indexPath.row == 2) {
        [cell.bestGroupImgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", array[2]]]];
    } else if (indexPath.row == 3) {
        [cell.bestGroupImgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", array[3]]]];
    } else if (indexPath.row == 4) {
        [cell.bestGroupImgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", array[4]]]];
    }
    
    return cell;
}

//返回增补视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{

    self.bestGroupModel = _dataArray[indexPath.section];
    if (kind == UICollectionElementKindSectionHeader) {
        // 从重用池里面取出来
        BestGroupCollectionReusableView *headerReuseView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:bestHeaderIdentifier forIndexPath:indexPath];//kind和header都可以
        // 设置header上的文字
        headerReuseView.headerTitleLabel.text = _bestGroupModel.title;
        // 返回增补视图；
        return headerReuseView;
    } else {
        BestGroupCollectionReusableView *footerReuseView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:bestFooterIdentifier forIndexPath:indexPath];
        // 设置footer上的文字
        footerReuseView.footerTitleLabel.text = _bestGroupModel.des;
        // 返回增补视图
        return footerReuseView;
    }
}

//点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    BestGroupDetailController *BGDetailVC = [[BestGroupDetailController alloc] init];
    [self.navigationController pushViewController:BGDetailVC animated:YES];
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
