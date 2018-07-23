//
//  NSArray+ICXLog.m
//  ICXCommercialPR
//
//  Created by Leo on 2018/5/10.
//  Copyright © 2018年 ICX. All rights reserved.
//

#import <Foundation/Foundation.h>

@implementation NSArray (ICXLog)
/**
 解决数组输出中文乱码的问题
 
 @return 输出结果
 */
- (NSString *)descriptionWithLocale:(id)locale {
    
    NSMutableString *string = [NSMutableString stringWithString:@"(\n"];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [string appendFormat:@"\t%@,\n", obj];
    }];
    if ([string hasSuffix:@",\n"]) {
        [string deleteCharactersInRange:NSMakeRange(string.length - 2, 1)]; // 删除最后一个逗号
    }
    [string appendString:@")\n"];
    return string;
}
@end
