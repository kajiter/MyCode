//
//  ICXSystemInfo.h
//  ICXInediaProject
//
//  Created by TYFanrong on 2018/6/27.
//  Copyright © 2018年 TYFanrong. All rights reserved.
//

#import <Foundation/Foundation.h>

//App版本号
#define App_Version [ICXSystemInfo getAppVersion]

//App名称
#define App_Name [ICXSystemInfo getAppName]

//手机型号
#define iPhone_Type [ICXSystemInfo getPhoneType]


@interface ICXSystemInfo : NSObject


/**
 获取手机型号

 @return 手机型号
 */
+ (NSString *)getPhoneType;

/**
 获取App版本号
 
 @return 返回当前App版本号
 */
+ (NSString *)getAppVersion;


/**
 获取App名称，这里主要是用于后台接口上传AppName
 
 @return App名称
 */
+ (NSString *)getAppName;

@end
