//
//  AddressFletModel.h
//  AddressPicker
//
//  Created by TYFanrong on 2018/6/28.
//  Copyright © 2018年 TYFanrong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddressFletModel : NSObject

@property (nonatomic,copy) NSString *citycode;

@property (nonatomic,copy) NSString *adcode;

@property (nonatomic,copy) NSString *name;

@property (nonatomic,copy) NSString *center;

@property (nonatomic,copy) NSString *level;

@property (nonatomic,strong) NSArray *districts;


@end
