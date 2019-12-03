//
//  ColorMarco.h
//  MyCode
//
//  Created by CL on 2018/6/11.
//  Copyright © 2018年 CL. All rights reserved.
//

#ifndef ColorMarco_h
#define ColorMarco_h


//用于存放宏定义颜色
//----------------------颜色----------------------------
#define kColorFromHex(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0f green:((float)((hexValue & 0xFF00) >> 8))/255.0f blue:((float)(hexValue & 0xFF))/255.0f alpha:1.0]

#define kRGBColor(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0f]

#define kRandomColor  [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]



#define kClearColor                     [UIColor clearColor]
#define kBlackColor                     [UIColor blackColor]
#define kWhiteColor                     [UIColor whiteColor]
#define kDarkGrayColor                  [UIColor darkGrayColor]
#define kPurpleColor                    [UIColor purpleColor]
#define KYellowColor                    [UIColor yellowColor]
#define kOrangeColor                    [UIColor orangeColor]
#define kGreenColor                     [UIColor greenColor]


#define kRedColor               kRGBColor(212,59,51)
#define kBlueColor              kRGBColor(66,125,255)
#define kGrayColor              kRGBColor(217,217,217)
#define kBackGroundGrayColor    kRGBColor(245,245,245)





#define kBackgroundColor        kColorFromHex(0xFFFFFF)//主背景色
#define kMainColor              kColorFromHex(0x427DFF)//主色调.








#endif /* ColorMarco_h */
