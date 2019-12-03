//
//  ICXViewController.h
//  ICXHealthManagerModule
//
//  Created by Leo on 2018/3/20.
//  Copyright © 2018年 luoxin3116@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, NoDataReasonType) {
    NoDataSourceType = 1,
    NetFailType
};

@interface ICXViewController : UIViewController
/**
 修改状态栏颜色
 */

@property (nonatomic, assign) UIStatusBarStyle StatusBarStyle;

/**
 是否展示左侧返回
 */
@property (nonatomic, assign, getter = isShowLeftBack) BOOL showLeftBack;
/**
 是否隐藏导航栏
 */
@property (nonatomic, assign, getter=isHidenNaviBar) BOOL hidenNaviBar;
/**
 显示没有数据页面
 */
- (void)showNoDataImage;
/**
 移除无数据页面
 */
- (void)removeNoDataImage;
/**
 加载视图
 */
- (void)showLoadingAnimation;
/**
 停止加载
 */
- (void)stopLoadingAnimation;


/**
 UItableview没有数据源的原因类型
 */
@property (nonatomic,assign) NoDataReasonType noDataReason;


/**
 导航栏添加文本按钮
 
 @param titles 文本数组
 @param isLeft 是否是左边 非左即右
 @param target 目标
 @param action 点击方法
 @param tags tags数组 回调区分用
 */
- (void)addNavigationItemWithTitles:(NSArray *)titles isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags;

/**
 导航栏添加图标按钮
 
 @param imageNames 图标数组
 @param isLeft 是否是左边 非左即右
 @param target 目标
 @param action 点击方法
 @param tags tags数组 回调区分用
 */
- (void)addNavigationItemWithImageNames:(NSArray *)imageNames isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags;

/**
 默认返回按钮的点击事件，默认是返回，子类可重写
 */
- (void)backBtnClicked;

/**
 *  返回到指定控制器
 */
- (BOOL)shouldPopToCustomVC:(NSString *)classStr;
@end
