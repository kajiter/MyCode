//
//  ICXBadgeButton.m
//  BusinessDemo
//
//  Created by Leo on 2018/2/5.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import "ICXBadgeButton.h"

@implementation ICXBadgeButton

#pragma mark - init methods
/**
 *  首先设置尺寸
 */
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.hidden = YES;
        self.userInteractionEnabled = NO;
        self.titleLabel.font = [UIFont systemFontOfSize:12.0f];
        //设置背景图，可以为一个红底圈橙色，获取其他自定义的都可以
//未添加图片
//        [self setBackgroundImage:[self resizedImageWithName:@""] forState:UIControlStateNormal];
    }
    return self;
}

/**
 *  高亮和普通保持一致
 */
- (void)setHighlighted:(BOOL)highlighted { }

#pragma mark - setter & getter
/**
 *  重写setter方法 注意拷贝
 */
- (void)setValue:(NSString *)value {
    _value = [value copy];
    
    // 1.设置可见性
    if (value.length) {
        self.hidden = NO;
        // 2.设置尺寸
        CGRect frame = self.frame;
        frame.size.height = self.currentBackgroundImage.size.height;
        if (value.length > 1) {
            CGSize valueSize = [value sizeWithAttributes:@{NSFontAttributeName : self.titleLabel.font}];
            frame.size.width = valueSize.width + 10;
        } else {
            frame.size.width = self.currentBackgroundImage.size.width;
        }
        [super setFrame:frame];
        // 3.内容
        [self setTitle:value forState:UIControlStateNormal];
    } else {
        self.hidden = YES;
    }
}

- (void)setImage:(UIImage *)image{
    CGRect frame = self.frame;
    frame.size.height = self.currentBackgroundImage.size.height;
    CGSize imageSize = image.size;
    frame.size.width = imageSize.width - 10;
    [super setFrame:frame];
    [self setImage:image forState:UIControlStateNormal];
}

- (void)setFrame:(CGRect)frame{
    frame.size = self.frame.size;
    [super setFrame:frame];
}

- (void)setBounds:(CGRect)bounds {
    bounds.size = self.bounds.size;
    [super setBounds:bounds];
}

#pragma mark - system delegate

#pragma mark - custom delegate

#pragma mark - api methods

#pragma mark - event response

#pragma mark - private

- (UIImage *)resizedImageWithName:(NSString *)name{
    UIImage *image = [UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}
#pragma mark - getter / setter

@end
