//
//  Define.h
//  MyCode
//
//  Created by CL on 2018/6/11.
//  Copyright © 2018年 CL. All rights reserved.
//


#import "ColorMarco.h"
#import "UrlMarco.h"
#import "StaticName.h"
#import "ImageMarco.h"
#import "SizeMarco.h"

#ifndef Define_h
#define Define_h



#define kAPP_DOCUMENT_PATH  [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]
#define kAPP_TEMP_PATH      [NSHomeDirectory() stringByAppendingPathComponent:@"temp"]
#define kAPP_LIBRARY_PATH   [NSHomeDirectory() stringByAppendingPathComponent:@"Library"]
#define kAPP_LIBRARY_CACHES_PATH [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]





#endif /* Define_h */
