//
//  ICXNavigationController.m
//  ICXHealthManagerModule
//
//  Created by Leo on 2018/3/20.
//  Copyright © 2018年 luoxin3116@gmail.com. All rights reserved.
//

#import "ICXNavigationController.h"
@interface ICXNavigationController ()
@end

@implementation ICXNavigationController

#pragma mark - Lifecycle
+ (void)initialize {
    //设置导航栏全局状态
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setTitleTextAttributes
     :@{NSForegroundColorAttributeName : [UIColor colorWithRed:74/255.0 green:74/255.0 blue:74/255.0 alpha:1/1.0], NSFontAttributeName : [UIFont fontWithName:@"PingFangSC-Medium" size:16]}];
    [navBar setShadowImage:[UIImage new]];
}
- (void)viewDidLoad {
    [super viewDidLoad];
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    UIViewController *topVC = self.topViewController;
    return [topVC preferredStatusBarStyle];
}
@end
