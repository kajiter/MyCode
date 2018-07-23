//
//  ICXLanguageTool.h
//  Meum
//
//  Created by 吕佳珍 on 2017/12/12.
//  Copyright © 2017年 huangwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICXLanguageTool : NSObject

/**
 *  获取当前的语言环境
 *  2016/07/18 modify By Aney
 *  @return 返回对应的语言环境
 */

+ (NSString*)currentLanguage;


/**
 判断当前手机语言是否是中文，用于国际化
 
 @return YES表示是中文,NO表示为非中文
 */
+ (BOOL)isChineseLanguage;


/**
 获取手机系统所有的国家
 
 @return 包含国家名称字符串的数组
 */
+ (NSMutableArray *)getSystermAllCountry;


/**
 获取系统国家以及国家对应的地区编号映射关系
 
 @return 以编号为value，国家名称为key的字典
 */
+ (NSDictionary *)getSystermCountryWithCode;

@end
