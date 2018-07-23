//
//  DataMD5.h
//  HSZMarketV1
//
//  Created by HaoShiZai on 15/12/25.
//  Copyright © 2015年 kajiter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataMD5 : NSObject

-(NSString *)createMD5SingForPay:(NSString *)appid_key partnerid:(NSString *)partnerid_key prepayid:(NSString *)prepayid_key package:(NSString *)package_key noncestr:(NSString *)noncestr_key timestamp:(UInt32)timestamp_key ;

-(NSString *) md5:(NSString *)str ;

@end
