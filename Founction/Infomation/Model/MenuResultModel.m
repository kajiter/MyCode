//
//  MenuResultModel.m
//  MyCode
//
//  Created by CL on 2018/6/18.
//  Copyright © 2018年 CL. All rights reserved.
//

#import "MenuResultModel.h"

@implementation MenuResultModel


@end


@implementation resultModel

+ (NSDictionary *)modelContainerPropertyGenericClass
{
    return @{
             @"bigChilds" : [bigChildsModel class] ,
             };
}

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"bigChilds"    : @"childs",
             };
}


@end



@implementation bigChildsModel

+ (NSDictionary *)modelContainerPropertyGenericClass
{
    return @{
             @"childs" : [childsModel class] ,
             };
}
@end



@implementation childsModel


@end


@implementation categoryInfo


@end
