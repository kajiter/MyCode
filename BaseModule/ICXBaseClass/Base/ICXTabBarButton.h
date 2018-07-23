//
//  ICXTabBarButton.h
//  BusinessDemo
//
//  Created by Leo on 2018/2/5.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ICXTabBarButton : UIButton
/**
 *  tabbar 上面的子控件只能是UITabBarItem
 */
@property (nonatomic, weak) UITabBarItem *item;
@end
