//
//  UIView+Extension.h
//  LvChatDemo
//
//  Created by 吕佳珍 on 16/2/17.
//  Copyright © 2016年 XianZhuangGuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic,assign) CGFloat left;
@property (nonatomic,assign) CGFloat top;
@property (nonatomic,assign) CGFloat height;
@property (nonatomic,assign) CGFloat right;
@property (nonatomic,assign) CGFloat bottom;
@property (nonatomic,assign) CGFloat width;
@property (nonatomic,assign) CGPoint origin;
@property (nonatomic,assign) CGSize size;
@property (nonatomic,assign) CGFloat centerX;
@property (nonatomic,assign) CGFloat centerY;

- (UIViewController *)viewcontroller;

- (void)configRectCorner:(UIRectCorner)rectCorner size:(CGSize)size;


@end
