//
//  ICXTabBarController.m
//  ICXCommercialPR
//
//  Created by Leo on 2018/2/5.
//  Copyright © 2018年 ICX. All rights reserved.
//

#import "ICXTabBarController.h"
#import "ICXTabbar.h"
#import "ICXNavigationController.h"

@interface ICXTabBarController ()<ICXTabBarDelegate>
@property (nonatomic,weak) ICXTabbar *customTabBar;
@property (nonatomic,strong) NSArray *childVCs;
@property (nonatomic,strong) NSArray *titles;
@property (nonatomic,strong) NSArray *normalImages;
@property (nonatomic,strong) NSArray *selectedImages;
@end

@implementation ICXTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
}
/**
 *  每次即将显示的时候必须移除系统自带的
 */
//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
////    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 11) {
//        for (UIControl *tabBarBtn in self.tabBar.subviews) {
//            if ([tabBarBtn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
//                [tabBarBtn removeFromSuperview];
//            }
//        }
////    }
//}
//- (void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//    // 移除之前的4个UITabBarButton
////    if ([[[UIDevice currentDevice] systemVersion] floatValue]>= 11) {
//        for (UIControl *tabBarBtn in self.tabBar.subviews) {
//            if ([tabBarBtn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
//                [tabBarBtn removeFromSuperview];
//            }
//        }
////    }
//}
//
///**
// *  初始化tabbar
// */
//- (void)setUpTabBar {
//    // 0.设置tabbar的背景
//#warning - NO 需要添加背景图
////    self.tabBar.backgroundImage = [UIImage imageNamed:@""];
////    self.tabBar.shadowImage = [[UIImage alloc] init];
//
//    // 1.自定义的tabbar 覆盖系统的就行
//    ICXTabbar *customTabBar = [[ICXTabbar alloc] init];
//    customTabBar.frame = self.tabBar.bounds;  // frame
//    customTabBar.delegate = self;
//    [self.tabBar addSubview:customTabBar];
//    self.customTabBar = customTabBar;
//}

/**
 *  初始化子控制器
 */
+ (instancetype _Nonnull)tabbarWithChildViewControllers:(NSArray<UIViewController *>  * _Nonnull)childVC titles:(NSArray<NSString *> * _Nonnull)titles normalImageNames:(NSArray<NSString *> * _Nonnull)normalImages selectedImages:(NSArray<NSString *> * _Nonnull)selectedImages{
    ICXTabBarController *tabVC = [[ICXTabBarController alloc] init];
    tabVC.childVCs = childVC;
    tabVC.titles = titles;
    tabVC.normalImages = normalImages;
    tabVC.selectedImages = selectedImages;
    // 1.初始化tabbar
//    [tabVC setUpTabBar];
    // 2.初始化子控制器
    [tabVC setUpChildViewControllers];
    return tabVC;
}

- (void)setUpChildViewControllers {
    
    self.tabBar.translucent = NO;
    self.tabBar.tintColor = [UIColor whiteColor];
    //设置背景图片
//    UIImage *background = [[UIImage imageNamed:@"背景图片"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch];
//    [self.tabBar setBackgroundImage:background];
    
//    UIImage *selectedBackground = [[UIImage imageNamed:@"选中后的背景图片"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch];
//    [self.tabBar setSelectionIndicatorImage:selectedBackground];
    
    
    
    
    
    
    for (NSInteger i = 0; i < self.childVCs.count;  ++ i) {
        [self setUpChildViewController:self.childVCs[i] title:self.titles[i] imageName:self.normalImages[i] selectedImageName:self.selectedImages[i]];
    }
}
/**
 *  添加一个子控制器
 *
 *  @param childVc           子控制器
 *  @param title             标题
 *  @param imageName         图片
 *  @param selectedImageName 选中的图片
 */
- (void)setUpChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    // 1.设置数据
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.title = title;
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateSelected];
    // 2.用导航控制器包装
    ICXNavigationController *nav = [[ICXNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
    // 3.添加按钮
//    [self.customTabBar addTabBarButtonWithItem:childVc.tabBarItem];
}

/**
 *  tabBar选中了按钮
 *
 *  @param from   以前的位置
 *  @param to     现在的位置
 */
- (void)tabBar:(ICXTabbar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to {
    self.selectedIndex = to;
}
#pragma mark - system delegate

#pragma mark - custom delegate

#pragma mark - api methods

#pragma mark - event response

#pragma mark - private

#pragma mark - getter / setter


@end
