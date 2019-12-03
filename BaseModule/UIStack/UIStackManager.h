//
//  UIStackManager.h
//  HSZTF
//
//  Created by CL on 2017/2/24.
//  Copyright © 2017年 CL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseNavigationController.h"
#import "BaseTabBarController.h"


@interface UIStackManager : NSObject

@property(nonatomic,retain)BaseTabBarController * tabBarController;



+(instancetype)shareManager ;

-(void)setupUIStack ;


-(BaseTabBarController *)currentTabBarController ;
-(BaseNavigationController *)currentNavigationController ;

- (void)showHomePage;

@end
