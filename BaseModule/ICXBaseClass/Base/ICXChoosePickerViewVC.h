//
//  ICXChoosePickerViewVC.h
//  MyCode
//
//  Created by TYFanrong on 2018/7/19.
//  Copyright © 2018年 CL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ICXChoosePickerViewVC : UIViewController

@property (nonatomic, copy) void(^didSelectRows)(NSArray<NSNumber *> * curSelectIndexArr);

- (void)configDataSourceArr:(NSArray<NSArray<NSString *> *> *)dataSourceArr curSelectIndexArr:(NSArray<NSNumber *> *)curSelectIndexArr;

@end
