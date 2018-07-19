//
//  ICXBadgeButton.h
//  BusinessDemo
//
//  Created by Leo on 2018/2/5.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ICXBadgeButton : UIButton
/**
 *  设定数值
 */
@property (nonatomic, copy) NSString *value;
/**
 *  图片设定
 */
@property (nonatomic, weak) UIImage *image;
@end
