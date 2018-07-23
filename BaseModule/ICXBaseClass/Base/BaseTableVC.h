//
//  BaseTableVC.h
//  HSZTF
//
//  Created by CL on 2017/2/24.
//  Copyright © 2017年 CL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableVC : UIViewController <UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate,UITextFieldDelegate,UIActionSheetDelegate,UITextViewDelegate,WKNavigationDelegate> 

@property(nonatomic,retain)UITableView * tableView ;


-(void)setTopRightBtnWithImage:(NSString *)imageName ;
-(void)setTopRightBtnWithTitle:(NSString *)title ;

-(void)topRightBtnC ;



@property(retain,nonatomic)UIView * alphaView;
@property(retain,nonatomic)UIImageView * emptyImageView;


//触摸alphaView 响应事件提供重用
-(void)touchAlphaViewAction ;

//提供弹窗消息便于继承调用
-(void)showAlertViewWithTag:(NSInteger)tag andMessage:(NSString *)message;

-(void)showHudProgress:(NSInteger)time ;

//提供提醒消息便于继承调用
-(void)showHUD:(NSString *)message andTime:(NSInteger)time;

#pragma mark 网络请求到错误100 用户登录已过期时，提供接口
-(void)loadNeedLoginNotification ;



@end
