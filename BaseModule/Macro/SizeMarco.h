//
//  SizeMarco.h
//  MyCode
//
//  Created by CL on 2018/6/11.
//  Copyright © 2018年 CL. All rights reserved.
//

#ifndef SizeMarco_h
#define SizeMarco_h


#define kScreenWidth        [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight       [[UIScreen mainScreen] bounds].size.height
#define kScreenFit(length) (kScreenWidth /375.0 * length) //等iPhone6@1x 尺寸缩放


#define kAPPStatusHeight     (Is_Iphone_X ? 44 : 20)
#define kAPPStatusRealHeight ([[UIApplication sharedApplication] statusBarFrame].size.height)
#define kAPPNomalNaviHeight  44
#define kAPPTopHeight        (APPStatusHeight + APPNomalNaviHeight) //导航栏 + 状态栏高度

#define kAPPSafeareHeight    (Is_Iphone_X ? 22 : 0 )
#define kAPPTabbarHeight     (Is_Iphone_X ? 83 : 49)



#define IsIOS8  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IsIOS9  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)
#define IsIOS10 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0)
#define IsIOS11 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0)

#define Is_Iphone_4s ([[UIScreen mainScreen] bounds].size.height == 320.0f)
#define Is_Iphone_5s ([[UIScreen mainScreen] bounds].size.height == 568.0f)
#define Is_Iphone_6  ([[UIScreen mainScreen] bounds].size.height == 667.0f)
#define Is_Iphone_6P ([[UIScreen mainScreen] bounds].size.height == 736.0f)
#define Is_Iphone_X  ([[UIScreen mainScreen] bounds].size.height == 812.0f)  // iPhonex  5.8寸   375*812







#endif /* SizeMarco_h */
