//
//  UIButton+Relayout.h
//  MyCode
//
//  Created by TYFanrong on 2018/7/19.
//  Copyright © 2018年 CL. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,ButtonLayoutStyle) {
    
    ButtonLayoutStyle_Default  = 0,          //UIButton默认 标题在右 图片在左
    
    ButtonLayoutStyle_TitleOnLeft  = 1,      //标题在左 图片在右
    
    ButtonLayoutStyle_TitleOnTop = 2,        //标题在上 图片在下
    
    ButtonLayoutStyle_TitleOnButtom = 3,     //标题在下 图片在上
    
};

@interface UIButton (Relayout)

/**
 *  设置button的titleLabel和imageView的布局样式及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)reLayoutButtonWithEdgeInsetsStyle:(ButtonLayoutStyle)style
                        imageTitleSpace:(CGFloat)space;

@end
