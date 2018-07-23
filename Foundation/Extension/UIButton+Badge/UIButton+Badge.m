//
//  UIButton+Badge.m
//  ButtonCategary
//
//  Created by HaoShiZai on 16/4/5.
//  Copyright © 2016年 kajiter. All rights reserved.
//

#import "UIButton+Badge.h"


@implementation UIButton (Badge)

@dynamic badge;
-(void)setBadge:(NSInteger)badge {
    
    if (badge != 0) {
        
        UIBadgeView * badgeView = [[UIBadgeView alloc]initWithFrame:CGRectMake(self.bounds.size.width - 30, 5, 30, 25)];
        badgeView.value = badge;
        
        [self addSubview:badgeView];
        
    }else{
        for (UIView * aview in [self subviews]) {
            if ([aview isKindOfClass:[UIBadgeView class]]) {
                [aview removeFromSuperview];
            }
        }
    }
}

@end
