//
//  HeaderlineTableViewController.m
//  LOL_Box
//
//  Created by lanou3g on 15/11/23.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import "HeaderlineTableViewController.h"
#import "HeaderlineTableViewCell.h"

@interface HeaderlineTableViewController ()

// 最外层大字典
@property (nonatomic, retain) NSMutableDictionary *dataDictionary;
// headerline个数
@property (nonatomic, retain) NSMutableArray *dataArray;

@end

// 重用标识符
static NSString *headerlineIdentifier = @"headerlineCell";

@implementation HeaderlineTableViewController

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
        self.navigationItem.title = @"头条";
        // 网络解析
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:kHeaderlineURL]];
        NSURLSession *session = [NSURLSession sharedSession];
        __weak typeof(self)temp = self;
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            self.dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:&error];
//            NSLog(@"++++%ld", _dataDictionary.count);
            self.dataArray = self.dataDictionary[@"headerline"];
            [temp.tableView reloadData];
            NSLog(@"======%@", [NSThread currentThread]);
        }];
        
        [task resume];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 注册
    [self.tableView registerNib:[UINib nibWithNibName:@"HeaderlineTableViewCell" bundle:nil] forCellReuseIdentifier:headerlineIdentifier];
    
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
//    NSArray *array = _dataDictionary[@"headerline"];
//    return array.count;
    NSLog(@"%--------------ld",_dataArray.count);
    return self.dataArray.count;
//    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HeaderlineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:headerlineIdentifier forIndexPath:indexPath];
    
    NSString *str = _dataDictionary[@"headerline"][indexPath.row][@"photo"];
    [cell.headerlineIMG sd_setImageWithURL:[NSURL URLWithString:str]];
    
    return cell;
}

// 每个cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 210;
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
