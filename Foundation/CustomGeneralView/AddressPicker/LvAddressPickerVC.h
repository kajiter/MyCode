//
//  LvAddressPickerVC.h
//  AddressPicker
//
//  Created by TYFanrong on 2018/6/28.
//  Copyright © 2018年 TYFanrong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddressFletModel.h"



@interface LvAddressPickerVC : UIViewController


@property (nonatomic,copy) void(^commitBlock)(NSString *address, NSString *zipcode);


@property (nonatomic,copy) NSString *cancelButtonTitle;


@property (nonatomic,copy) NSString *sureButtonTitle;


@property (nonatomic,strong) UIColor *sureButtonTitleColor;


@property (nonatomic,strong) UIColor *cancelButtonTitleColor;


@property (nonatomic,strong) UIColor *sureButtonBackgroundColor;


@property (nonatomic,strong) UIColor *cancelButtonBackgroundColor;


@property (nonatomic, strong) UIButton *cancelBtn;


@property (nonatomic, strong) UIButton *sureBtn;


@property (nonatomic,assign) NSInteger numberOfComponents;


@end
