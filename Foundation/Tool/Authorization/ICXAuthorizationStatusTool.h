//
//  ICXAuthorizationStatusTool.h
//  ICXPublicTools
//
//  Created by TYFanrong on 2018/6/27.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <CoreLocation/CoreLocation.h>
#import <Photos/Photos.h>

@interface ICXAuthorizationStatusTool : NSObject

/**
 判断相机权限是否打开
 */
+ (BOOL)remindCameraAuthorization;


/**
 判断相册权限是否打开
 */
+ (BOOL)remindAssetsLibraryAuthorization;


/**
 判断定位权限是否打开
 */
+ (BOOL)remindLocationAuthorization;


/**
 判断麦克风权限是否打开
 
 @return YES Or NO
 */
+ (BOOL)remindAudioAuthorization;



/**
 判断保存照片到相册的权限是否打开

 @return YES Or NO
 */
+ (BOOL)remindSavePhotoToAlbumAuthorization;
@end
