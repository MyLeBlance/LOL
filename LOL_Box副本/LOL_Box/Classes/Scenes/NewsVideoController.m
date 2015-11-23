//
//  NewsVideoController.m
//  LOL_Box
//
//  Created by lanou3g on 15/11/23.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import "NewsVideoController.h"
#import "NewsVideoCell.h"
#import "NewsVideoDetailViewController.h"

@interface NewsVideoController ()

// 最外层大字典
@property (nonatomic, retain) NSMutableDictionary *dataDictionary;
// 外层数组，用于承接个数
@property (nonatomic, retain) NSMutableArray *dataArray;

@end

// 重用标志符
static NSString *newsVideoIdent = @"newsVideoCell";

@implementation NewsVideoController

// 懒加载
- (NSMutableDictionary *)dataDictionary {
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
- (instancetype)initWithStyle:(UITableViewStyle)style{
    if ([super initWithStyle:style]) {
        // 设置标题
        self.navigationItem.title = @"视频";
        // 网络解析
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:kHeaderlineURL]];
        __weak typeof(self)temp = self;
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            self.dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:&error];
            self.dataArray = _dataDictionary[@"data"];
            NSLog(@"+++++++%ld", _dataArray.count);
            [temp.tableView reloadData];
//            NSLog(@"======%@", [NSThread currentThread]); // 打印走哪个线程
        }];

        [task resume];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 注册
    [self.tableView registerNib:[UINib nibWithNibName:@"NewsVideoCell" bundle:nil] forCellReuseIdentifier:newsVideoIdent];
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
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:newsVideoIdent forIndexPath:indexPath];
    NSDictionary *dic = _dataDictionary[@"data"][indexPath.row];
    // 图片
    [cell.newsVideoIMG sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", dic[@"photo"]]]];
    // title
    cell.titleLabel.text = dic[@"title"];
    // content
    cell.contentLabel.text = dic[@"content"];
    cell.contentLabel.textColor = [UIColor grayColor];
    cell.contentLabel.font = [UIFont systemFontOfSize:15];
    // readCount
    cell.readCountLabel.text = [NSString stringWithFormat:@"%@ 次阅读", dic[@"readCount"]];
    cell.readCountLabel.textColor = [UIColor grayColor];
    cell.readCountLabel.font = [UIFont systemFontOfSize:13];
    cell.readCountLabel.textAlignment = NSTextAlignmentRight;
    // 选中cell时的样式
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    // 取消下划线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    return cell;
}

// 设置cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

// 点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsVideoDetailViewController *newsDetailVC = [[NewsVideoDetailViewController alloc] init];
    [self.navigationController pushViewController:newsDetailVC animated:YES];
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
