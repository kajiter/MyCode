//
//  ICXTabbar.h
//  BusinessDemo
//
//  Created by Leo on 2018/2/5.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ICXTabbar;

@protocol ICXTabBarDelegate <NSObject>

@optional
/**
 *  ICXTabBar上面的按钮被选中了
 *
 *  @param tabBar 被点击的HTTabBar
 *  @param from   原来按钮的位置
 *  @param to     新被选中按钮的位置
 */
- (void)tabBar:(ICXTabbar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to;
@end
@interface ICXTabbar : UIView
/**
 *  添加按钮
 *
 *  @param item 模型数据
 */
- (void)addTabBarButtonWithItem:(UITabBarItem *)item;

/**
 *  代理 命名以及在理解上需要加强
 */
@property (nonatomic, weak) id<ICXTabBarDelegate> delegate;
@end
