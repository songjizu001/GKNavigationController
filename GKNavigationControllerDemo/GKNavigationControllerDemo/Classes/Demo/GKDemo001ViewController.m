//
//  GKFirstViewController.m
//  GKNavigationController
//
//  Created by QuintGao on 2017/6/22.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import "GKDemo001ViewController.h"
#import "GKDemo002ViewController.h"
#import "GKDemo005ViewController.h"
#import "GKNavigationController.h"

@interface GKDemo001ViewController ()

@end

@implementation GKDemo001ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"控制器001";
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    
    self.gk_fullScreenPopDisabled = YES;
    
    UILabel *label = [UILabel new];
    label.text = @"我是变色导航栏控制器，我禁用了全屏手势返回，使用系统的边缘手势返回可以返回哦！";
    label.font = [UIFont systemFontOfSize:16];
    label.numberOfLines = 0;
    label.frame = CGRectMake(0, 200, self.view.frame.size.width, 0);
    [label sizeToFit];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    UIButton *btn = [UIButton new];
    btn.frame = CGRectMake(100, 100, 60, 20);
    btn.backgroundColor = [UIColor blackColor];
    [btn setTitle:@"Push" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(dismiss)];
}

- (void)dismiss {
    if ([self.tabBarController isKindOfClass:[GKDemo005ViewController class]]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)btnAction {
    GKDemo002ViewController *demo002VC = [GKDemo002ViewController new];
    [self.navigationController pushViewController:demo002VC animated:YES];
    
    demo002VC.hidesBottomBarWhenPushed = NO;
}

- (BOOL)navigationShouldPopOnBackButton {
    return YES;
}

@end