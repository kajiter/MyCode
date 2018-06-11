//
//  BaseNavigationController.m
//  HSZTF
//
//  Created by CL on 2017/2/24.
//  Copyright © 2017年 CL. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

+ (void)initialize
{
    
    //配置导航条自定义属性
    UINavigationBar * navBar = [UINavigationBar appearance];
    [navBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [navBar setShadowImage:[UIImage new]];
    navBar.tintColor = [UIColor whiteColor];
    navBar.barTintColor = [UIColor redColor];
    navBar.translucent = NO ;//设置导航条不透明
    
    
    NSMutableDictionary *att = [NSMutableDictionary dictionary];
    att[NSForegroundColorAttributeName] = [UIColor whiteColor];
    att[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];    
    [navBar setTitleTextAttributes:att];
    
    
    ///配置导航条上按钮的统配属性
    
//    NSMutableDictionary *itemAttrs = [NSMutableDictionary dictionary];
//    itemAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
//    itemAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:17];

//    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
//    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
//    [appearance setTitleTextAttributes:itemAttrs forState:UIControlStateNormal];
    
    
//    NSMutableDictionary *highTextAttrs = [NSMutableDictionary dictionaryWithDictionary:itemAttrs];
//    highTextAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
//    [appearance setTitleTextAttributes:highTextAttrs forState:UIControlStateHighlighted];
//
//    NSMutableDictionary *itemDisabledAttrs = [NSMutableDictionary dictionary];
//    itemDisabledAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
//    [appearance setTitleTextAttributes:itemDisabledAttrs forState:UIControlStateDisabled];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO; // 默认为YES，
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


@end
