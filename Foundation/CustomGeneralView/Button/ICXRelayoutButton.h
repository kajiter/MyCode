//
//  ICXRelayoutButton.h
//  ICXCommercialPR
//
//  Created by TYFanrong on 2018/6/13.
//  Copyright © 2018年 ICX. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger,ButtonLayoutType) {
    
    ButtonLayoutType_Default  = 0,          //UIButton默认 标题在右 图片在左
    
    ButtonLayoutType_TitleOnLeft  = 1,      //标题在左 图片在右
    
    ButtonLayoutType_TitleOnTop = 2,        //标题在上 图片在下
    
    ButtonLayoutType_TitleOnButtom = 3,     //标题在下 图片在上
    
};

@interface ICXRelayoutButton : UIButton

/**
 图片大小
 */
@property (assign,nonatomic)IBInspectable CGSize imageSize;

/**
 图片与标题的间距
 */
@property (assign,nonatomic)IBInspectable CGFloat offset;

/**
 图片与标题的布局方式
 */
@property (assign,nonatomic)IBInspectable ButtonLayoutType layoutType;


@end
