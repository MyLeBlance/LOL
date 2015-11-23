//
//  Sherry.m
//  LOL_Box
//
//  Created by lanou3g on 15/11/21.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import "Sherry.h"

@interface Sherry ()

// 最外层大数组
@property (nonatomic, retain) NSMutableDictionary *dataDictionary;

@end

// 英雄详情   // 资料",@"技能",@"视频",@"出装",@"配音",@"皮肤"
#define kHeroDeatailURL @"http://box.dwstatic.com/skin/Yasuo/Yasuo_Splash_0.jpg"
// 英雄技能图片
#define kHeroDetailSkillPicture @"http://img.lolbox.duowan.com/abilities/Yasuo_E_64x64.png?v=10&OSType=iOS7.0.3"
// 英雄视频
#define KHeroDetailVideo @"http://box.dwstatic.com/apiVideoesNormalDuowan.php?action=l&p=1&v=108&OSType=iOS8.3&tag=Yasuo&src=letv"
// 英雄配音
#define kHeroDetailVoice @"http://box.dwstatic.com/apiHeroSound.php?hero=Yasuo&v=108&OSType=iOS8.3&versionName=2.2.5"
// 英雄皮肤
#define kHeroDetailSkin @"http://box.dwstatic.com/apiHeroSkin.php?hero=Yasuo&v=108&OSType=iOS8.3&versionName=2.2.5"
// 英雄出装
#define kHeroDetailZB @"http://db.duowan.com/lolcz/img/ku11/api/lolcz.php?v=108&OSType=iOS8.3&championName=Yasuo&limit=7"
static NSString *identifier = @"cell";
@implementation Sherry

// 懒加载
- (NSMutableDictionary *)dataDictionary{
    if (!_dataDictionary) {
        _dataDictionary = [NSMutableDictionary new];
    }
    return _dataDictionary;
}

- (instancetype)initWithStyle:(UITableViewStyle)style{
    if ([super initWithStyle:style]) {
        
        NSArray *array = @[KHeroDetailVideo, kHeroDetailVoice];
        
        
        // 网络解析
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:array[1]]];
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            self.dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:&error];
            
        }];
        [task resume];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.url = 11;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Disposle of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
//    cell.backgroundColor= [UIColor redColor];
    // Configure the cell...
    
    return cell;
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
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
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
