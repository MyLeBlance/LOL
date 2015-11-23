//
//  TabBarController.m
//  LOL_Box
//
//  Created by lanou3g on 15/11/16.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import "TabBarController.h"
#import "HeroViewController.h"
#import "VideoViewController.h"
#import "NewsViewController.h"
#import "MyBoxViewController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.英雄界面
    HeroViewController *heroVC = [[HeroViewController alloc] init];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:heroVC];
    nav1.navigationBar.barTintColor = [UIColor colorWithRed:87/255.0 green:138/255.0 blue:157/255.0 alpha:1];
    //2.视频界面
    VideoViewController *videoVC = [[VideoViewController alloc] init];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:videoVC];
    nav2.navigationBar.barTintColor = [UIColor colorWithRed:87/255.0 green:138/255.0 blue:157/255.0 alpha:1];
    //3.新闻界面
    NewsViewController *newsVC = [[NewsViewController alloc] init];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:newsVC];
    nav3.navigationBar.barTintColor = [UIColor colorWithRed:87/255.0 green:138/255.0 blue:157/255.0 alpha:1];
    //4.我的盒子界面
    MyBoxViewController *myBoxVC = [[MyBoxViewController alloc] init];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:myBoxVC];
    nav4.navigationBar.barTintColor = [UIColor colorWithRed:87/255.0 green:138/255.0 blue:157/255.0 alpha:1];
    //标签视图控制器指定子视图控制器
    self.viewControllers = @[nav1, nav2, nav3, nav4];
    
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
