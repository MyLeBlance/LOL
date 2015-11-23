//
//  VideoTableViewController.m
//  LOL_Box
//
//  Created by lanou3g on 15/11/19.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import "VideoTableViewController.h"
#import "VideoTableViewCell.h"
#import "VideoDataManager.h"
#import "VideoDetailViewController.h"

@interface VideoTableViewController ()

//用于承接外层网络解析数据
@property (nonatomic, retain) NSMutableArray *dataArray;
//用于承接最外层所有对象
@property (nonatomic, retain) NSArray *array;

@end

static NSString *identifier = @"cell";

@implementation VideoTableViewController

//懒加载
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
    }
    return _dataArray;
}
- (NSArray *)array{
    if (!_array) {
        _array = [NSArray new];
    }
    return _array;
}


- (instancetype)initWithStyle:(UITableViewStyle)style{
    self = [super initWithStyle:style];
    if (self) {
        //网络解析
        NSMutableURLRequest *videoRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:kVideoListURL]];
        NSURLSession *videoSession = [NSURLSession sharedSession];
        NSURLSessionDataTask *task = [videoSession dataTaskWithRequest:videoRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            self.array = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:&error];
            for (NSDictionary *dict in _array) {
                DetailVideoModel *detailVideoModel = [DetailVideoModel new];
                [detailVideoModel setValuesForKeysWithDictionary:dict];
                [self.dataArray addObject:detailVideoModel];
//                NSLog(@"+++++%@", self.dataArray[0]);
            }
            //返回主线程刷新数据
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        }];
        [task resume];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
#warning --- 用属性传值的时候必须要写在这个地方，写在上面的初始化方法里传不过来
    // 设置标题
    self.navigationItem.title = _string;
    
    // 注册自定义cell
    [self.tableView registerNib:[UINib nibWithNibName:@"VideoTableViewCell" bundle:nil] forCellReuseIdentifier:identifier];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    // 标题
    NSDictionary *dic = self.array[indexPath.row];
    cell.label1.text = dic[@"title"];
    cell.label1.numberOfLines = 2;
    cell.label1.font = [UIFont systemFontOfSize:16];
    // 时间
    cell.label2.text = dic[@"upload_time"];
    cell.label2.textAlignment = NSTextAlignmentRight;
    cell.label2.font = [UIFont systemFontOfSize:13];
    cell.label2.textColor = [UIColor grayColor];
    // 点击量
    cell.label3.text = [NSString stringWithFormat:@"点击量:%@", dic[@"amount_play"]];
    cell.label3.textAlignment = NSTextAlignmentCenter;
    cell.label3.font = [UIFont systemFontOfSize:14];
    cell.label3.textColor = [UIColor grayColor];
    // 图片
    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", dic[@"cover_url"]]]];
    // 设置cell的选中样式
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    // 去掉cell的下划线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    VideoDetailViewController *videoDetailVC = [[VideoDetailViewController alloc] init];
    [self.navigationController pushViewController:videoDetailVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
