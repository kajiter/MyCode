//
//  UIStackManager.m
//  HSZTF
//
//  Created by CL on 2017/2/24.
//  Copyright © 2017年 CL. All rights reserved.
//

#import "UIStackManager.h"
#import <UIKit/UIKit.h>

static UIStackManager * _manager = nil;


@implementation UIStackManager

+(instancetype)shareManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[UIStackManager alloc]init];
        
    });
    
    return _manager;
}

-(void)setupUIStack {
    
    self.tabBarController = [[BaseTabBarController alloc]init];
    [self.tabBarController setupTabBar];
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow ;
    
    keyWindow.rootViewController = self.tabBarController;
    
    
//    IntroductionVC * introVC = [[IntroductionVC alloc] init];
//    BaseNav * introNav = [[BaseNav alloc] initWithRootViewController:introVC];
//
//    keyWindow.rootViewController = introNav;
//
//    __block IntroductionVC * weakintroVC = introVC;
//
//    [introVC enterToMainVC:^{
//
//        [weakintroVC.view removeFromSuperview];
//        keyWindow.rootViewController = _tabBarController;
//    }];
    
}



-(BaseTabBarController *)currentTabBarController {
    return _tabBarController;
}

-(BaseNavigationController *)currentNavigationController {
    return (BaseNavigationController *)_tabBarController.selectedViewController;
}



- (void)showHomePage{
    [[self currentNavigationController] popToRootViewControllerAnimated:NO];
    self.tabBarController.selectedIndex = 0;
}


@end
