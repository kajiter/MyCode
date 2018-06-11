//
//  BaseTab.m
//  HSZTF
//
//  Created by CL on 2017/2/24.
//  Copyright © 2017年 CL. All rights reserved.
//

#import "BaseTabBarController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

+ (void)initialize
{
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    attrs[NSForegroundColorAttributeName] =  [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor];
    [UITabBar appearance].alpha = 0.8;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(void)setupTabBar {
    

//    [self addChildViewController:[[SeckillVC alloc] init] title:@"限量秒杀" defaultImageName:kImageTabBarDefault1 andSelectedImageName:kImageTabBarSelect1];
//    [self addChildViewController:[[BonusShopVC alloc] init] title:@"返利商城" defaultImageName:kImageTabBarDefault2 andSelectedImageName:kImageTabBarSelect2];
//    [self addChildViewController:[[SuperCutVC alloc] init] title:@"超级满减" defaultImageName:kImageTabBarDefault3 andSelectedImageName:kImageTabBarSelect3];
//    [self addChildViewController:[[RushListVC alloc] init] title:@"抢购清单" defaultImageName:kImageTabBarDefault4 andSelectedImageName:kImageTabBarSelect4];
//    [self addChildViewController:[[MineVC alloc] init] title:@"我的好实再" defaultImageName:kImageTabBarDefault5 andSelectedImageName:kImageTabBarSelect5];
    
    
}

-(void)addChildViewController:(UIViewController *)childController title:(NSString *)title defaultImageName:(NSString *)defaultImageName andSelectedImageName:(NSString *)selectedImageName {
    
    childController.title = title;
    childController.tabBarItem.title = title;
    childController.tabBarItem.image = [UIImage imageNamed:defaultImageName];
    
    UIImage * selectedIamge = [UIImage imageNamed:selectedImageName];
    selectedIamge = [selectedIamge imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.tabBarItem.selectedImage = selectedIamge;
    
    
    BaseNav * nav = [[BaseNav alloc]initWithRootViewController:childController];
    
    [self addChildViewController:nav];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
