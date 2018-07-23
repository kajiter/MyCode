//
//  ICXAuthorizationStatusTool.m
//  ICXPublicTools
//
//  Created by TYFanrong on 2018/6/27.
//

#import "ICXAuthorizationStatusTool.h"

@implementation ICXAuthorizationStatusTool

/**
 判断相机权限是否打开
 */
+ (BOOL)remindCameraAuthorization
{
    NSString *mediaType = AVMediaTypeVideo;
    
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
    
    if(authStatus == ALAuthorizationStatusRestricted || authStatus == ALAuthorizationStatusDenied){
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:NSLocalizedString(@"comm_tip",nil) message:NSLocalizedString(@"comm_access_camera_alert",nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"comm_ok",nil) otherButtonTitles:nil, nil];
        [alert show];
        
        return NO;
        
    }
    return YES;
    
    
}



/**
 判断相册权限是否打开
 */
+ (BOOL)remindAssetsLibraryAuthorization
{
    
    ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
    if (author == ALAuthorizationStatusRestricted || author == ALAuthorizationStatusDenied)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:NSLocalizedString(@"comm_tip",nil) message:NSLocalizedString(@"comm_access_photo_library_alert",nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"comm_ok",nil) otherButtonTitles:nil, nil];
        [alert show];
        
        return NO;
    }
    
    return YES;
    
}



/**
 判断定位权限是否打开
 */
+ (BOOL)remindLocationAuthorization
{
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if (kCLAuthorizationStatusDenied == status || kCLAuthorizationStatusRestricted == status)
    {
        //读取本地数据
        
        UIAlertView * positioningAlertivew = [[UIAlertView alloc]initWithTitle:NSLocalizedString(@"comm_tip",nil) message:NSLocalizedString(@"comm_access_location_alert",nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"comm_ok",nil) otherButtonTitles:nil,nil];
        [positioningAlertivew show];
        return NO;
        
    }
    return YES;
    
}


/**
 判断麦克风权限是否打开
 
 @return YES Or NO
 */
+ (BOOL)remindAudioAuthorization
{
    __block BOOL bCanRecord = YES;
    
    NSString *systemVersion = [[UIDevice currentDevice] systemVersion];
    
    if ([systemVersion integerValue] > 7)
    {
        AVAudioSession *audioSession = [AVAudioSession sharedInstance];
        if ([audioSession respondsToSelector:@selector(requestRecordPermission:)]) {
            [audioSession performSelector:@selector(requestRecordPermission:) withObject:^(BOOL granted) {
                bCanRecord = granted;
            }];
        }
        
        if (!bCanRecord) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:NSLocalizedString(@"TYPub_menu_cannot_record_voice",nil) message:NSLocalizedString(@"comm_access_nicrophone_alert",nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"comm_ok",nil) otherButtonTitles:nil, nil];
            [alert show];
        }
        return bCanRecord;
        
    }
    
    
    return bCanRecord;
}


/**
 判断保存照片到相册的权限是否打开
 
 @return YES Or NO
 */
+ (BOOL)remindSavePhotoToAlbumAuthorization
{
    
    __block BOOL bCanSave = YES;
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusAuthorized) {
        bCanSave = YES;
        
    }else{
        NSLog(@"Denied or Restricted");
        bCanSave = NO;
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:NSLocalizedString(@"TYPub_menu_cannot_save",nil) message:NSLocalizedString(@"TYPub_menu_setting_photo",nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"comm_ok",nil) otherButtonTitles:nil, nil];
            [alert show];
        });
    }
    return bCanSave;
    
}

@end
