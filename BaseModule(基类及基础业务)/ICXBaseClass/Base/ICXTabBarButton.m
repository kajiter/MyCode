//
//  ICXTabBarButton.m
//  BusinessDemo
//
//  Created by Leo on 2018/2/5.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import "ICXTabBarButton.h"
#import "ICXBadgeButton.h"
// 图标的比例
const double ICXTabBarImageRatio = 0.65;
@interface ICXTabBarButton()
@property (weak, nonatomic) ICXBadgeButton *badgeButton;
@end
@implementation ICXTabBarButton
#pragma mark - init methods
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        // 1.图片居中
        self.imageView.contentMode = UIViewContentModeCenter;
        // 2.文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        [self setTitleColor:[UIColor colorWithRed:113/255.0 green:116/255.0 blue:133/255.0 alpha:1] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor colorWithRed:98/255.0 green:125/255.0 blue:239/255.0 alpha:1] forState:UIControlStateSelected];
        // 4.添加一个显示红色提醒数字的按钮
        [self setUpBadgeButton];
    }
    return self;
}

- (void)setUpBadgeButton {
    ICXBadgeButton *badgeButton = [[ICXBadgeButton alloc] init];
    badgeButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
    [self addSubview:badgeButton];
    self.badgeButton = badgeButton;
}

/**
 *  目的是去掉父类在高亮时所做的操作
 */
- (void)setHighlighted:(BOOL)highlighted {}

#pragma mark - 覆盖父类的2个方法
#pragma mark 设置按钮标题的frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat titleY = contentRect.size.height * ICXTabBarImageRatio;
    CGFloat titleH = contentRect.size.height - titleY;
    CGFloat titleW = contentRect.size.width;
    return CGRectMake(0, titleY, titleW,  titleH);
}

#pragma mark 设置按钮图片的frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat imageH = contentRect.size.height * ICXTabBarImageRatio;
    CGFloat imageW = contentRect.size.width;
    return CGRectMake(0, 0, imageW,  imageH);
}

- (void)setItem:(UITabBarItem *)item {
    _item = item;
    
    // 设置文字&图片
    [self setTitle:self.item.title forState:UIControlStateNormal];
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    // 设置提醒数字
    self.badgeButton.value = self.item.badgeValue;
    CGFloat badgeButtonX = self.frame.size.width - self.badgeButton.frame.size.width - 5;
    CGFloat badgeButtonY = 2;
    self.badgeButton.frame = CGRectMake(badgeButtonX, badgeButtonY, 0, 0);
//    // 1.利用KVO监听item属性值的改变
//    [_item addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
//    [_item addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
//    [_item addObserver:self forKeyPath:@"selectedImage" options:NSKeyValueObservingOptionNew context:nil];
////    [_item addObserver:self forKeyPath:@"badgeValue" options:NSKeyValueObservingOptionNew context:nil];
//    // 2.属性赋值
//    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}

/**
 *  KVO监听必须在监听器释放的时候，移除监听操作
 *  通知也得在释放的时候移除监听
 */
- (void)dealloc {
//    [self.item removeObserver:self forKeyPath:@"title"];
//    [self.item removeObserver:self forKeyPath:@"image"];
//    [self.item removeObserver:self forKeyPath:@"selectedImage"];
//    [self.item removeObserver:self forKeyPath:@"badgeValue"];
}

/**
 *  监听item的属性值改变
 *
 *  @param keyPath 哪个属性改变了
 *  @param object  哪个对象的属性改变了
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    // 设置文字&图片
    [self setTitle:self.item.title forState:UIControlStateNormal];
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    // 设置提醒数字
    self.badgeButton.value = self.item.badgeValue;
    CGFloat badgeButtonX = self.frame.size.width - self.badgeButton.frame.size.width - 5;
    CGFloat badgeButtonY = 2;
    self.badgeButton.frame = CGRectMake(badgeButtonX, badgeButtonY, 0, 0);
}
#pragma mark - system delegate

#pragma mark - custom delegate

#pragma mark - api methods

#pragma mark - event response

#pragma mark - private

#pragma mark - getter / setter

@end
