//
//  ICXRelayoutButton.h
//  ICXCommercialPR
//
//  Created by TYFanrong on 2018/6/13.
//  Copyright © 2018年 ICX. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger,ICXRelayoutButtonType) {
    ICXRelayoutButtonTypeNomal  = 0,//默认
    ICXRelayoutButtonTypeLeft   = 1,//标题在左
    ICXRelayoutButtonTypeBottom = 2,//标题在下
};

@interface ICXRelayoutButton : UIButton

/**
 图片大小
 */
@property (assign,nonatomic)IBInspectable CGSize imageSize;

/**
 图片相对于 top/right 的 offset
 */
@property (assign,nonatomic)IBInspectable CGFloat offset;


@property (assign,nonatomic)IBInspectable ICXRelayoutButtonType layoutType;


@end
