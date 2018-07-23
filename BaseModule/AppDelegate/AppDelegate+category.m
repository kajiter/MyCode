//
//  AppDelegate+category.m
//  HSZTF
//
//  Created by CL on 2017/2/24.
//  Copyright © 2017年 CL. All rights reserved.
//

#import "AppDelegate+category.h"
#import <AFNetworking.h>

@implementation AppDelegate (category)


-(void)initWithCode {

    
//    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/javascript"];
//    [manager GET:@"" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSDictionary * dic = responseObject ;
//        NSDictionary * data = [[dic objectForKey:@"results"] firstObject];
//        NSString * netVersion = [data objectForKey:@"version"] ;
    
        
//        //获取本地app版本
//        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
//        NSString * localVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
//        
//        
//        BOOL needUpdate = [MyTools compareVersion:netVersion andLocalVersion:localVersion];
//
//        if (needUpdate) {
//
//            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"有新版本了，快到App Store升级吧" delegate:self cancelButtonTitle:@"暂不升级" otherButtonTitles:@"升级体验" ,nil] ;
//            alert.tag = 123;
//            [alert show];
//
//            [MyTools showHUD:@"有新版本了，快到App Store升级吧" andTime:1];
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"%@",error);
//
//    }];
    
    
    
    
}




//-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
//    
//    if (alertView.tag == 123 ){
//        if (buttonIndex == 1) {
//            NSString *nurl1 = @"";
//            nurl1 = [nurl1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//            NSURL *url = [NSURL URLWithString:nurl1];
//            
//            [[UIApplication sharedApplication] openURL:url];
//        }
//        
//    }
//}


@end
