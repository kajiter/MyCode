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
#define APPStatusHeight     (Is_Iphone_X ? 44 : 20)
#define APPStatusRealHeight ([[UIApplication sharedApplication] statusBarFrame].size.height)
#define APPNomalNaviHeight  44
#define APPTopHeight        (APPStatusHeight + APPNomalNaviHeight) //导航栏 + 状态栏高度
#define APPSafeareHeight    (Is_Iphone_X ? 22 : 0 )
#define APPTabbarHeight     (Is_Iphone_X ? 83 : 49)




#endif /* SizeMarco_h */
