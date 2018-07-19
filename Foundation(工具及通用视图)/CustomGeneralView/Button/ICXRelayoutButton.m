//
//  ICXRelayoutButton.m
//  ICXCommercialPR
//
//  Created by TYFanrong on 2018/6/13.
//  Copyright © 2018年 ICX. All rights reserved.
//

#import "ICXRelayoutButton.h"
#import "UIView+Extension.h"
@implementation ICXRelayoutButton

- (void)layoutSubviews{
    [super layoutSubviews];
    self.titleLabel.numberOfLines = 0;
    if (self.layoutType == ICXRelayoutButtonTypeBottom) {
        self.titleLabel.height = self.height - CGRectGetMaxY(self.imageView.frame);
    }
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)setlayoutType:(ICXRelayoutButtonType)layoutType
{
    _layoutType = layoutType;
    
    if (layoutType != ICXRelayoutButtonTypeNomal)
    {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
}

//重写父类方法,改变标题和image的坐标
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    
    if (self.layoutType == ICXRelayoutButtonTypeLeft)
    {
        
        CGFloat x = contentRect.size.width  - self.imageSize.width ;
        CGFloat y =  contentRect.size.height -  self.imageSize.height;
        y = y/2;
        CGRect rect = CGRectMake(x,y,self.imageSize.width,self.imageSize.height);
        return rect;
    }
    else if (self.layoutType == ICXRelayoutButtonTypeBottom)
    {
        
        CGFloat x =  contentRect.size.width -  self.imageSize.width;
        CGFloat y =   self.offset   ;
        x = x / 2;
        CGRect rect = CGRectMake(x,y,self.imageSize.width,self.imageSize.height);
        return rect;
    }
    else
    {
        return [super imageRectForContentRect:contentRect];
    }
    
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    
    if (self.layoutType == ICXRelayoutButtonTypeLeft)
    {
        return CGRectMake(0, 0, contentRect.size.width - self.offset - self.imageSize.width , contentRect.size.height);
    }
    else if (self.layoutType == ICXRelayoutButtonTypeBottom)
    {
        return CGRectMake(0,   self.offset + self.imageSize.height , contentRect.size.width , contentRect.size.height - self.offset - self.imageSize.height );
    }
    else
    {
        return [super titleRectForContentRect:contentRect];
    }
}


@end

