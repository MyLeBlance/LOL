//
//  MyBoxViewController.m
//  LOL_Box
//
//  Created by lanou3g on 15/11/16.
//  Copyright © 2015年 wangjicheng.com. All rights reserved.
//

#import "MyBoxViewController.h"

@interface MyBoxViewController ()

//声明属性UILabel & UITextField & UIButton
@property (nonatomic, retain) UILabel *label;
@property (nonatomic, retain) UITextField *textField;
@property (nonatomic, retain) UIButton *btn;

@end

@implementation MyBoxViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // 设置标题
        self.navigationItem.title = @"我的盒子";
        // 设置tabBar
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的盒子" image:[UIImage imageNamed:@"myBox"] tag:1000];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *array1 = @[@"账号", @"密码", @"所在大区"];
    NSArray *array2 = @[@"请输入账号", @"请输入密码", @"请选择所在大区"];
    for (int i = 0; i < 3; i++) {
        //label
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(50, 150 + 60 * i, 80, 35)];
        _label.text = array1[i];
        _label.textAlignment = NSTextAlignmentLeft;
        [self.view addSubview:_label];
        
        //textField
        self.textField = [[UITextField alloc] initWithFrame:CGRectMake(150, 150 + 60 * i, 214, 35)];
        _textField.placeholder = array2[i];
        _textField.backgroundColor = [UIColor lightGrayColor];
        _textField.textAlignment = NSTextAlignmentCenter;
        _textField.borderStyle = UITextBorderStyleRoundedRect;
        [self.view addSubview:_textField];
    }
    
    NSArray *array3 = @[@"登陆", @"取消"];
    for (int j = 0; j < 2; j++) {
        //btn
        self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn.frame = CGRectMake(100 + 164 * j, 350, 70, 35);
        if (j == 0) {
            _btn.backgroundColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:75/255.0 alpha:1];
            [_btn addTarget:self action:@selector(loginPage:) forControlEvents:UIControlEventTouchUpInside];
        } else if (j == 1) {
            _btn.backgroundColor = [UIColor colorWithRed:230/255.0 green:130/255.0 blue:40/255.0 alpha:1];
            [_btn addTarget:self action:@selector(registerUserPage:) forControlEvents:UIControlEventTouchUpInside];
        }
        [_btn setTitle:array3[j] forState:UIControlStateNormal];
        [self.view addSubview:_btn];
    }
    
}

//点击事件
- (void)loginPage:(UIButton *)sender{
    
}
- (void)registerUserPage:(UIButton *)sender{
    
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
