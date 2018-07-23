//
//  ICXTabbar.m
//  BusinessDemo
//
//  Created by Leo on 2018/2/5.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import "ICXTabbar.h"
#import "ICXTabBarButton.h"
@interface ICXTabbar()
/**
 *  存放tabBar上面的按钮
 */
@property (nonatomic, strong) NSMutableArray *tabBarButtons;
/**
 *  tabBar上被选中的按钮
 */
@property (nonatomic, weak) ICXTabBarButton *selectedButton;
@end
@implementation ICXTabbar

/**
 *  初始化 在初始化中添加加号按钮
 */
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

/**
 *  添加按钮
 *
 *  @param item item模型
 */
- (void)addTabBarButtonWithItem:(UITabBarItem *)item {
    // 1.创建按钮
    ICXTabBarButton *button = [[ICXTabBarButton alloc] init];
    
    // 2.传递模型数据
    button.item = item;
    
    // 3.添加按钮
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    [self addSubview:button];
    
    [self.tabBarButtons addObject:button];
    
    // 4.默认选中
    if (self.tabBarButtons.count == 1) {
        
        [self buttonClick:button];
    }
}

- (void)buttonClick:(ICXTabBarButton *)button {
    // 0.通知代理
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)]) {
        
        [self.delegate tabBar:self didSelectedButtonFrom:self.selectedButton.tag to:button.tag];
    }
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
    for (UIView *imageView in button.subviews) {
        if ([imageView isKindOfClass:[UIImageView class]]) {
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
            animation.keyPath = @"transform.scale";
            animation.values = @[@1.0,@1.3,@0.9,@1.15,@0.95,@1.02,@1.0];
            animation.duration = 1;
            animation.calculationMode = kCAAnimationCubic;
            [imageView.layer addAnimation:animation forKey:nil];
        }
    }
}

/**
 *  布局子控件
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 1.4个按钮 固定的尺寸所以不需要写在循环里面节约性能
    CGFloat buttonW = self.frame.size.width / self.subviews.count;
    
    CGFloat buttonH = self.frame.size.height;
    
    for (int index = 0; index < self.tabBarButtons.count; index++) {
        
        // 1.取出按钮
        ICXTabBarButton *button = self.tabBarButtons[index];
        
        button.tag = index;
        
        // 2.设置frame
        CGFloat buttonX = index * buttonW;
        
        // 循环一次 值变化一次 所以这里才是如何用一个变量 表示出所有的控件
        button.frame = CGRectMake(buttonX, 0, buttonW, buttonH);
    }
}

#pragma mark - init methods

#pragma mark - system delegate

#pragma mark - custom delegate

#pragma mark - api methods

#pragma mark - event response

#pragma mark - private

#pragma mark - getter / setter
/**
 *  tabBarButtons懒加载 只初始化一次 不用管他何时创建
 */
- (NSMutableArray *)tabBarButtons {
    if (_tabBarButtons == nil) {
        _tabBarButtons = [NSMutableArray array];
    }
    return _tabBarButtons;
}

@end
