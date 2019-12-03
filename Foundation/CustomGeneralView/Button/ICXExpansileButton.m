//
//  ICXExpansileButton.m
//  ICXCommercialPR
//
//  Created by TYFanrong on 2018/5/30.
//  Copyright © 2018年 ICX. All rights reserved.
//

#import "ICXExpansileButton.h"

@implementation ICXExpansileButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent*)event

{
    
    CGRect bounds =self.bounds;
    
    CGFloat widthDelta =44.0- bounds.size.width;
    
    CGFloat heightDelta =44.0- bounds.size.height;
    
    bounds = CGRectInset(bounds, -0.5* widthDelta, -0.5* heightDelta);//注意这里是负数，扩大了之前的bounds的范围
    
    return CGRectContainsPoint(bounds, point);
    
}




@end
