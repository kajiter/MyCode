
//
//  Created by zhuochunsheng on 16/6/30.
//  Copyright © 2016年 fenda. All rights reserved.


#import <Foundation/Foundation.h>

/**
 *  传入名字，简单描述和详细描述，输出log，用宏定义打印当前log

 *
 *  @param name   名字string
 *  @param simple 简单描述string
 *  @param detail 详细描述string
 *
 *  @return
 */
#define FDLog(name,simple,detail) [XZLog logFromWhom:name andSimpleLogDescription:simple andDetailLogDescription:detail andFileString:[NSString stringWithFormat:@"[%@:%d] %s",[NSString stringWithFormat:@"%s",__FILE__].lastPathComponent,__LINE__,__func__]]

/**
 *  传入名字，简单描述和详细描述，输出log，用宏定义打印当前log
 *
 *  @param name   名字string
 *  @param simple 简单描述string
 *  @param detail 详细描述string
 *  @param color  颜色string    FDColor(r,g,b)
 *
 *  @return
 */
#define FDColorLog(name,simple,detail,color) [XZLog logFromWhom:name andSimpleLogDescription:simple andDetailLogDescription:detail andColorString:color]


//#define FDColorLog(name,simple,detail,color) [XZLog logFromWhom:name andSimpleLogDescription:simple andDetailLogDescription:detail andFileString:[NSString stringWithFormat:@"[%@:%d] %s",[NSString stringWithFormat:@"%s",__FILE__].lastPathComponent,__LINE__,__func__] andColorString:color]

#define FDColor(r,g,b) [NSString stringWithFormat:@"%ld,%ld,%ld",(long)r,(long)g,(long)b]



@interface XZLog : NSObject

/**
 *  init log
 */
+(void)initLog;

/**
 *  崩溃日志打印
 *
 *  by nelsen 2016.09.13
 */
+ (void)setLogCrash;

/**
 *  设置文件夹保存几天的数据
 *
 *  @param number 多少天
 */
+(void)setNumberOfDaysToDelete:(NSInteger)number;

/**
 *  输入一个名称string和简单描述string、详细描述string，这里打印的类只能是XZLog，需要用宏定义才能打印当前类
 *
 *  @param nameString              打印者的名称string
 *  @param simpleDescriptionString 简单描述string
 *  @param detailDescriptionString 详细描述string
 *  by xiaoZhuo   2016/06/29
 */
+ (void)logFromWhom:(NSString *)nameString andSimpleLogDescription:(NSString *)simpleDescriptionString andDetailLogDescription:(NSString *)detailDescriptionString andFileString:(NSString *)fileString;

/**
 *  输入一个名称string和简单描述string、详细描述string、字体颜色string。这里打印的类只能是XZLog，需要用宏定义才能打印当前类
 *
 *  @param nameString              打印者的名称string
 *  @param simpleDescriptionString 简单描述string
 *  @param detailDescriptionString 详细描述string
 *  @param foreGroundColorString   字体颜色string
 *  by xiaoZhuo   2016/06/29
 */
+ (void)logFromWhom:(NSString *)nameString andSimpleLogDescription:(NSString *)simpleDescriptionString andDetailLogDescription:(NSString *)detailDescriptionString andFileString:(NSString *)fileString andColorString:(NSString *)foreGroundColorString;

/**
 *  输入一个名称string和简单描述string、详细描述string、字体颜色string。这里打印的类只能是XZLog，需要用宏定义才能打印当前类
 *
 *  @param nameString              打印者的名称string
 *  @param simpleDescriptionString 简单描述string
 *  @param detailDescriptionString 详细描述string
 *  @param foreGroundColorString   字体颜色string
 *  by nelsen   2016/06/29
 */
+ (void)logFromWhom:(NSString *)nameString andSimpleLogDescription:(NSString *)simpleDescriptionString andDetailLogDescription:(NSString *)detailDescriptionString andColorString:(NSString *)foreGroundColorString;

@end