//
//  ICXTabBarController.h
//  ICXCommercialPR
//
//  Created by Leo on 2018/2/5.
//  Copyright © 2018年 ICX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ICXTabBarController : UITabBarController

/**
 传入参数构建TabBarController

 @param childVC 子控制器
 @param names 标题
 @param normalImage 普通状态图标
 @param selectedImages 高亮图标
 @return 返回tabBarVC
 */
+ (instancetype _Nonnull)tabbarWithChildViewControllers:(NSArray<UIViewController *>  * _Nonnull)childVC titles:(NSArray<NSString *> * _Nonnull)titles normalImageNames:(NSArray<NSString *> * _Nonnull)normalImages selectedImages:(NSArray<NSString *> * _Nonnull)selectedImages;
@end
